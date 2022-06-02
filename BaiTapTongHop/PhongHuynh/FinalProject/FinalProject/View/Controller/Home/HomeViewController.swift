import UIKit

@available(iOS 13.0, *)
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
        tableView.register(FeaturedVideoHomeCell.self)
        tableView.register(NominationVideoCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        //        tableView.rowHeight = UITableView.automaticDimension
    }

    private func configNavigation() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "youtube"))
        navigationItem.titleView = imageView
        let leftProfile = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-person-30"), style: .plain, target: self, action: #selector(leftProfileAction))
        navigationItem.leftBarButtonItem = leftProfile
        let rightSetting = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-setting-24"), style: .plain, target: self, action: #selector(rightSettingAction))
        let rightSearch = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-search-30"), style: .plain, target: self, action: #selector(rightSearchAction))
        navigationItem.rightBarButtonItems = [rightSetting, rightSearch]
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
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

    private func loadNominationVideoData(completion: @escaping () -> Void) {
        viewModel.loadNominationVideoAPI { [weak self] (result) in
            guard let this = self else {
                completion()
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    break
                case .failure(let error):
                    this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
                }
                completion()
            }
        }
    }

    private func loadNewVideoData(completion: @escaping () -> Void ) {
        viewModel.loadNewVideoAPI { [weak self] (result) in
            guard let this = self else {
                completion()
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    break
                case .failure(let error):
                    this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
                }
                completion()
            }
        }
    }

    private func loadVideoTrendingData(completion: @escaping () -> Void ) {
        viewModel.loadVideoTrendingAPI { [weak self] (result) in
            guard let this = self else {
                completion()
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    break
                case .failure(let error):
                    this.alert(title: "Error", msg: error.localizedDescription, handler: nil)
                }
                completion()
            }
        }
    }

    // MARK: - Objc functions
    @objc private func leftProfileAction() {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    @objc private func rightSettingAction() {
    }

    @objc private func rightSearchAction() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource
@available(iOS 13.0, *)
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
        case .new, .nomination:
            let cell = tableView.dequeue(NominationVideoCell.self)
            cell.viewModel = viewModel.viewModelForNomination(indexPath: indexPath)
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = HomeViewModel.CellType(rawValue: indexPath.row) else { return 0 }
        switch cellType {
        case .featured:
            return 270
        case .nomination, .new:
            return 255
        }
    }
}

// MARK: - UITableViewDelegate
@available(iOS 13.0, *)
extension HomeViewController: UITableViewDelegate {
}

// MARK: - NominationVideoCellDelegate
@available(iOS 13.0, *)
extension HomeViewController: NominationVideoCellDelegate {

    func controller(controller: NominationVideoCell, needsPerfom actions: NominationVideoCell.Action) {
        switch actions {
        case .moveToDetail(let indexPath, let type):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetail(cellType: type, indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - FeaturedVideoHomeCellDelegate
@available(iOS 13.0, *)
extension HomeViewController: FeaturedVideoHomeCellDelegate {
    func controller(controller: FeaturedVideoHomeCell, needsPerfom actions: FeaturedVideoHomeCell.Action) {
        switch actions {
        case .moveToDetail(let indexPath):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetail(cellType: .featured, indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
