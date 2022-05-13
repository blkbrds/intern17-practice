import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: HomeViewModel = HomeViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        viewModel.loadAPI { [weak self] (result) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success:
                    this.tableView.reloadData()
                case .failure(let error):
                    print("error\(error)")
                }
            }
        }
    }

    // MARK: - Private functions
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController()
        navigationController?.pushViewController(detail, animated: true)
    }
}
