import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: HomeViewModel = HomeViewModel()
    var viewModel2: HomeViewModel = HomeViewModel()
    var viewModel3: HomeViewModel = HomeViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configTableView()
        loadData()
    }

    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "NewVideoHomeCell", bundle: Bundle.main)
        let nib2 = UINib(nibName: "FeaturedVideoHomeCell", bundle: Bundle.main)
        let nib3 = UINib(nibName: "NominationVideoCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "NewVideoHomeCell")
        tableView.register(nib2, forCellReuseIdentifier: "FeaturedVideoHomeCell")
        tableView.register(nib3, forCellReuseIdentifier: "NominationVideoCell")
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
        viewModel2.loadNewVideoAPI { (result) in
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
        viewModel3.loadVideoTrendingAPI { (result) in
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

    @objc func leftProfileAction() {
        let vc = ProfileViewController()
        present(vc, animated: true, completion: nil)
    }

    @objc func rightSettingAction() {
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedVideoHomeCell") as? FeaturedVideoHomeCell else { return UITableViewCell() }
            cell.viewModel = viewModel3.viewModelForFeaturedVideo(indexPath: indexPath)
            cell.delegate = self
            return cell
        } else if indexPath.row == 1 {
            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "NewVideoHomeCell") as? NewVideoHomeCell else { return UITableViewCell() }
            cell1.viewModel = viewModel2.viewModelForNewVideo(indexPath: indexPath)
            cell1.delegate = self
            return cell1
        } else if indexPath.row == 2 {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "NominationVideoCell") as? NominationVideoCell else { return UITableViewCell() }
            cell2.viewModel = viewModel.viewModelForNomination(indexPath: indexPath)
            cell2.delegate = self
            return cell2
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailViewController()
//        vc.viewModel = viewModel.viewModelForDetail(indexPath: indexPath)
//        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row <= 2 {
            return 300
        } else {
            return 0
        }
    }
}

extension HomeViewController: NominationVideoCellDelegate {

    func controller(controller: NominationVideoCell, needsPerfom actions: NominationVideoCell.Action) {
        switch actions {
        case .moveToHome(let indexPath):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetail(indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: NewVideoHomeCellDelegate {
    func controller(controller: NewVideoHomeCell, needsPerfom actions: NewVideoHomeCell.Action) {
        switch actions {
        case .moveToHome(let indexPath):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetail(indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: FeaturedVideoHomeCellDelegate {
    func controller(controller: FeaturedVideoHomeCell, needsPerfom actions: FeaturedVideoHomeCell.Action) {
        switch actions {
        case .moveToHome(let indexPath):
            let vc = DetailViewController()
            vc.viewModel = viewModel.viewModelForDetail(indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
