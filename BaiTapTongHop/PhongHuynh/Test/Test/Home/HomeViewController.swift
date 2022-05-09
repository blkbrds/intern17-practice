import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: HomeViewModel?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        viewModel = HomeViewModel()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - HomeCellDelegate
extension HomeViewController: HomeCellDelegate {
    
    func cell(cell: HomeCell, needsPerfom actions: HomeCell.Action) {
        switch actions {
        case .moveToDetail:
            guard let indexPath = tableView.indexPath(for: cell), let viewModel = viewModel else { return }
            viewModel.index = indexPath.row
            let vc = DetailViewController()
            vc.delegate = self
            vc.viewModel = viewModel.viewModelForDetail(at: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - DetailViewControllerDelegate
extension HomeViewController: DetailViewControllerDelegate {
    
    func controller(view: DetailViewController, needsPerfom actions: DetailViewController.Action) {
        switch actions {
        case .update(let user):
            guard let viewModel = viewModel else { return }
            viewModel.updateUser(user: user)
            tableView.reloadData()
        }
    }
}
