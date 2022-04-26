import UIKit

class Bai11ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    // MARK: Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate  = self
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension Bai11ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as? Bai11TableViewCell else { return UITableViewCell() }
        cell.updateTableCell(subtitle: Constants.array[indexPath.row])
        return cell
    }
}


    
    

