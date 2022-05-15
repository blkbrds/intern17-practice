//
//  Ex1ViewController.swift
//  API
//
//  Created by tri.nguyen on 14/05/2022.
//

import UIKit

// MARK: - Model
struct DataModel: Codable {
    var feed: FeedModel?
}

struct FeedModel: Codable {
    var author: AuthorModel?
}

struct AuthorModel: Codable {
    var name: LabelModel?
    var uri: LabelModel?
}

struct LabelModel: Codable {
    var label: String?
}

final class Ex1ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ex1"
        fetchData()
    }
    
    // MARK: - FetchData
    private func fetchData() {
        let url = "https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json"
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error")
                return
            }
            guard let data = data else { return }
            guard let httpResonse = response as? HTTPURLResponse, httpResonse.statusCode == 200 else { return }
            
            do {
                let author = try JSONDecoder().decode(DataModel.self, from: data)
                print(author)
            } catch let err {
                print(err)
            }
        }.resume() // connect
    }
}
