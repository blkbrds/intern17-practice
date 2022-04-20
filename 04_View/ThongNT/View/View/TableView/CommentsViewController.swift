//
//  CommentsViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/12/22.
//

import UIKit

final class CommentsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var commentsData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    
    private func configTableView() {
        //Load comment nib
        let commentNib = UINib(nibName: "CommentTableViewCell", bundle: .main)
        tableView.register(commentNib, forCellReuseIdentifier: "CommentTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.dataSource = self
    }
    
    private func loadData() {
        DumbData.news.forEach { news in
            commentsData.append(news.content)
        }
    }
}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
        cell.updateTableCell(with: "\(commentsData[indexPath.row])")
        return cell
    }
}
