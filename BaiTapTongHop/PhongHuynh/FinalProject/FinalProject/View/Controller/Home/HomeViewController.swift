import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    // MARK: - Private functions
        private func configTableView() {
            let nib = UINib(nibName: "NewVideoHomeCell", bundle: Bundle.main)
//            let nib2 = UINib(nibName: "FeaturedVideoHomeCell", bundle: Bundle.main)
//            let nib3 = UINib(nibName: "NominationVideoCell", bundle: Bundle.main)
            tableView.register(nib, forCellReuseIdentifier: "NewVideoHomeCell")
//            tableView.register(nib2, forCellReuseIdentifier: "FeaturedVideoHomeCell")
//            tableView.register(nib3, forCellReuseIdentifier: "NominationVideoCell")
            tableView.dataSource = self
            tableView.delegate = self
        }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewVideoHomeCell", for: indexPath) as? NewVideoHomeCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return cell
//        if indexPath.row == 0 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewVideoHomeCell") as? NewVideoHomeCell else { return UITableViewCell() }
//            return cell
//        } else {
//            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "FeaturedVideoHomeCell") as? FeaturedVideoHomeCell else { return UITableViewCell() }
//            cell2.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
//            return cell2
//        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 200
//        }
        return 150
    }
}
