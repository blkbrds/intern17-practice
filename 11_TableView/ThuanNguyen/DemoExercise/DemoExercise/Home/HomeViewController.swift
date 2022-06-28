//
//  HomeViewController.swift
//  DemoExercise
//
//  Created by thuan.nguyen on 28/06/2022.
//

import UIKit
class Items {
    var image: String
    var nameType: String
    var message: String
    var nameWriten: String
    init(image: String,nameType: String, message: String,nameWriten: String){
        self.image = image
        self.message = message
        self.nameType = nameType
        self.nameWriten = nameWriten
    }
}

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        configTableView()
    }

    private func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Config().items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else { return UITableViewCell() }
        cell.thumnailImage.image = UIImage(named: Config().items[indexPath.row].image)
        cell.typeName.text = Config().items[indexPath.row].nameType
        cell.titleName.text = Config().items[indexPath.row].message
        cell.writeName.text = Config().items[indexPath.row].nameWriten
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.image =  UIImage(named: Config().items[indexPath.row].image)
        vc.typeN = Config().items[indexPath.row].nameType
        vc.titleN = Config().items[indexPath.row].message
        vc.name = Config().items[indexPath.row].nameWriten
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController {
    struct Config {
        let items: [Items] = [
            Items(image: "rac-img", nameType: "Swift", message: "Drawing a Border with Rouded Corner", nameWriten: "Nguyen van a"),
            Items(image: "im", nameType: "Swift1", message: "Drawing a Border with Rouded Corner", nameWriten: "Nguyen van b"),
            Items(image: "rac-img", nameType: "Swift2", message: "Drawing a Border with Rouded Corner", nameWriten: "Nguyen van c"),
            Items(image: "im", nameType: "Swift3", message: "Drawing a Border with Rouded Corner", nameWriten: "Nguyen van d"),
            Items(image: "rac-img", nameType: "Swift4", message: "Drawing a Border with Rouded Corner", nameWriten: "Nguyen van e"),
            Items(image: "im", nameType: "Swift5", message: "Drawing a Border with Rouded Corner", nameWriten: "Nguyen van f")
        ]
}
}
