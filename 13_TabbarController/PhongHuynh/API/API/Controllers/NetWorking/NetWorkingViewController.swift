import UIKit

class NetWorkingViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewmodel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - config
    override func setupUI() {
        super.setupUI()
        
        title = "Home"
        configTableView()
        let resetTabbarItem = UIBarButtonItem(title: "load", style: .plain, target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = resetTabbarItem
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(homeAction))
        self.navigationItem.leftBarButtonItem = homeButton
    }
    
    override func setupData() {
    }
    
    func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    //MARK: - API
    @objc func loadAPI() {
        viewmodel.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }
    
    @objc func homeAction() {
        SceneDelegate.shared.setroot(with: .tabbar)
    }
    
    
}

//MARK: - Tableview Delegate & Datasource
extension NetWorkingViewController: UITableViewDataSource, UITableViewDelegate {
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
