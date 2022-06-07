//
//  Bai11ViewController.swift
//  TableView
//
//  Created by Tinh Bui T. VN.Danang on 5/24/22.
//

import UIKit

final class Bai11ViewController: UIViewController {
    
    // MARK: - Properties
    var contents: [String] = ["Trong 1 danh sách, thì có rất nhiều phẩn tử và để xác định phần tử đó hiển thị như thế nào, tức là tương ứng với một loại cell nào. Thì cần phải register cell cho TableView", "Trong 1 danh sách, thì có rất nhiều phẩn tử và để xác định phần tử đó hiển thị như thế nào,", " tức là tương ứng với một loại cell nào. Thì cần phải register cell cho TableView.Trong 1 danh sách, thì có rất nhiều phẩn tử và để xác định phần tử đó hiển thị như thế nào, tức là tương ứng với một loại cell nào. Thì cần phải register cell cho TableView.", "Ta không thể nào tạo nhiều array để cung cấp dữ liệu cho cell. Nó làm việc quản lý dữ liệu sẽ gặp rất nhiều khó khăn. Giải pháp là nhóm tụi nó về 1 array với 1 kiểu dữ liệu mới.", "Sau này, dữ liệu cũng cấp cho Table View sẽ lấy từ API/Webservice/Database.. và không lệ thuộc vào việc hardcode. Khuyến khích khi làm việc với Table View thì nên tạo các function với dữ liệu giả để cũng cấp dữ liệu cho các cell."]
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Private fuctions
    private func configTableView() {
        let nib = UINib(nibName: "TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension Bai11ViewController: UITableViewDataSource {
    
    func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.testlabel.text = contents[indexPath.row]
        return cell
    }
}
