//
//  Bai11ViewController.swift
//  TableView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/6/22.
//

import UIKit

final class Bai11ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var commentTableView: UITableView!
    
    // MARK: - Properties
    var comments: [String] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Private functions
    private func configTableView() {
        commentTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let nib = UINib(nibName: "CommentCell", bundle: .main)
        commentTableView.register(nib, forCellReuseIdentifier: "cell")
        commentTableView.dataSource = self
        commentTableView.delegate = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Comments", withExtension: "plist") else { return }
        guard let commentData = NSArray(contentsOf: path) as? [String] else { return }
        comments = commentData
    }
}

// MARK: - Extensions
extension Bai11ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
  
        cell.updateCommentTableCell(comment: comments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
