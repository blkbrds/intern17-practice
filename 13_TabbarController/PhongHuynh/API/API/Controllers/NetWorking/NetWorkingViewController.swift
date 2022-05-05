import UIKit

class NetWorkingViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewmodel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // updateUI()
    }
    
    // MARK: - config
    override func setupUI() {
        super.setupUI()
        //title
        self.title = "Home"
        
        //tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        //navi
        let resetTabbarItem = UIBarButtonItem(image: UIImage(named: "back1"), style: .plain, target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = resetTabbarItem
    }
    
    override func setupData() {
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    //MARK: - API
    @objc func loadAPI() {
        print("LOAD API")
        viewmodel.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }
}

//MARK: - Tableview Delegate & Datasource
extension NetWorkingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        cell.updateCell(name: viewmodel.names[indexPath.row], avatar: "back1")
        return cell
    }
}
