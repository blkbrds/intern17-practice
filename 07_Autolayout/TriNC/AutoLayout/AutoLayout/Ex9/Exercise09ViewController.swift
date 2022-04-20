//
//  Exercise09ViewController.swift
//  AutoLayout
//
//  Created by tri.nguyen on 15/04/2022.
//

import UIKit

// MARK: - Model
struct Picture {
    // MARK: - Properties
    let image: String
    let message: String
    
    init(image: String, message: String) {
        self.image = image
        self.message = message
    }
}

final class Exercise09ViewController: UIViewController {
    
    // MARK: - Properties
    var index = 0

    // MARK: - IBOutlets
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var informationLabel: UILabel!
    @IBOutlet private weak var photosImageView: UIImageView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Private Functions
    private func updateUI() {
        informationLabel.text = Config().pictures[index].message
        photosImageView.image = UIImage(named: Config().pictures[index].image)
    }
    
    // MARK: - IBActions
    @IBAction private func backButtonTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        photosImageView.image = UIImage(named: Config().pictures[index].image)
        informationLabel.text = Config().pictures[index].message
        valueLabel.text = "\(index + 1)"
    }
    
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        guard index < Config().pictures.count - 1 else { return }
        index += 1
        photosImageView.image = UIImage(named: Config().pictures[index].image)
        informationLabel.text = Config().pictures[index].message
        valueLabel.text = "\(index + 1)"
    }
}

// MARK: Extention
extension Exercise09ViewController {
    // MARK: - Config DummyData
    struct Config {
        let pictures: [Picture] = [
            Picture(image: "ic-1", message: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum"),
            Picture(image: "ic-2", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!"),
            Picture(image: "ic-3", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!, Lorem ipsum dolor sit"),
            Picture(image: "ic-4", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!, Lorem ipsum dolor sit"),
            Picture(image: "ic-5", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum,adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!"),
            Picture(image: "ic-1", message: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum"),
            Picture(image: "ic-2", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!"),
            Picture(image: "ic-3", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!, Lorem ipsum dolor sit"),
            Picture(image: "ic-4", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!, Lorem ipsum dolor sit"),
            Picture(image: "ic-5", message:  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum,adipisicing elit. Sunt harum voluptatibus possimus, deleniti eum, sit a sed iure ducimus deserunt distinctio suscipit magni! Praesentium, magni! Ea nobis quam enim corporis!")
        ]
    }
}
