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
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        let resetTabbarItem = UIBarButtonItem(title: "load", style: .plain, target: self, action: #selector(loadAPI))
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
        viewmodel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        cell.viewModel = viewmodel.viewModelForCell(at: indexPath)
        
//        if item.thumbnailImage != nil {
//            cell.thumbnail.image = item.thumbnailImage
//        } else {
//            cell.thumbnail.image = nil
//            
//            //downloader
//            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
//                if let image = image {
//                    cell.thumbnail.image = image
//                    item.thumbnailImage = image
//                } else {
//                    cell.thumbnail.image = nil
//                }
//            }
//        }
        return cell
    }
}
