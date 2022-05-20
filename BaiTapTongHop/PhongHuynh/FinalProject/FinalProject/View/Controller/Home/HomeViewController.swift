import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: HomeViewModel = HomeViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configTableView()
        loadData()
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.register(NewVideoHomeCell.self)
        tableView.register(FeaturedVideoHomeCell.self)
        tableView.register(NominationVideoCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        //        tableView.rowHeight = UITableView.automaticDimension
    }

    private func configNavigation() {
        title = "Youtube"
        let leftProfile = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-person-30"), style: .plain, target: self, action: #selector(leftProfileAction))
        navigationItem.leftBarButtonItem = leftProfile
        let rightSetting = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-setting-24"), style: .plain, target: self, action: #selector(rightSettingAction))
        navigationItem.rightBarButtonItem = rightSetting
    }

    private func loadData() {
        HUD.show()
        let group = DispatchGroup()
        group.enter()
        loadNominationVideoData {
            group.leave()
        }
        group.enter()
        loadNewVideoData {
            group.leave()
        }
        group.enter()
        loadVideoTrendingData {
            group.leave()
        }
        group.notify(queue: .main) {
            HUD.dismiss()
            self.tableView.reloadData()
        }
    }

    private func loadNominationVideoData(completion: @escaping () -> Void ) {
        viewModel.loadNominationVideoAPI { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion()
                case .failure(let error):
                    print("error\(error)")
                }
            }
        }
    }

    private func loadNewVideoData(completion: @escaping () -> Void ) {
        viewModel.loadNewVideoAPI { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion()
                case .failure(let error):
                    print("error\(error)")
                }
            }
        }
    }

    private func loadVideoTrendingData(completion: @escaping () -> Void ) {
        viewModel.loadVideoTrendingAPI { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion()
                case .failure(let error):
                    print("error\(error)")
                }
            }
        }
    }

    // MARK: - Objc functions
    @objc private func leftProfileAction() {
        let vc = ProfileViewController()
        present(vc, animated: true, completion: nil)
    }

    @objc private func rightSettingAction() {
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = HomeViewModel.CellType(rawValue: indexPath.row) else { return UITableViewCell() }
        switch cellType {
        case .featured:
            let cell = tableView.dequeue(FeaturedVideoHomeCell.self)
            cell.viewModel = viewModel.viewModelForFeaturedVideo(indexPath: indexPath)
            cell.delegate = self
            return cell
        case .new:
            let cell = tableView.dequeue(NewVideoHomeCell.self)
            cell.viewModel = viewModel.viewModelForNewVideo(indexPath: indexPath)
            cell.delegate = self
            return cell
        case .nomination:
            let cell = tableView.dequeue(NominationVideoCell.self)
            cell.viewModel = viewModel.viewModelForNomination(indexPath: indexPath)
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = HomeViewModel.CellType(rawValue: indexPath.row) else { return 0 }
        switch cellType {
        case .featured, .nomination, .new:
            return 300
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
}

// MARK: - NominationVideoCellDelegate
extension HomeViewController: NominationVideoCellDelegate {

    func controller(controller: NominationVideoCell, needsPerfom actions: NominationVideoCell.Action) {
        switch actions {
        case .moveToDetail(let indexPath):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetailNominationVideo(indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - NewVideoHomeCellDelegate
extension HomeViewController: NewVideoHomeCellDelegate {
    func controller(controller: NewVideoHomeCell, needsPerfom actions: NewVideoHomeCell.Action) {
        switch actions {
        case .moveToDetail(let indexPath):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetailNewVideo(indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - FeaturedVideoHomeCellDelegate
extension HomeViewController: FeaturedVideoHomeCellDelegate {
    func controller(controller: FeaturedVideoHomeCell, needsPerfom actions: FeaturedVideoHomeCell.Action) {
        switch actions {
        case .moveToDetail(let indexPath):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetailFeaturedVideo(indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
