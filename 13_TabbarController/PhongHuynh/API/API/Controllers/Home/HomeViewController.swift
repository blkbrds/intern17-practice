import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewmodel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configTableView()
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(nextAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
    
    func fetchData() {
       
    }
    
    @objc func nextAction() {
        SceneDelegate.shared.setroot(with: .login)
    }
    
}

//MARK: - Tableview Delegate & Datasource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        cell.viewModel = viewmodel.viewModelForCell(at: indexPath)
        return cell
    }
}
