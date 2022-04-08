import UIKit

final class Bai2ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI(names: ["name1", "name2", "name3", "name4", "name5", "name6", "name7", "name8", "name9"])
    }
    
    func configUI(names: [String]) {
        let khoangCach: CGFloat = 10
        let widthView: CGFloat = CGFloat((UIScreen.main.bounds.width - 40) / 3)
        for index in 0..<names.count {
            let x1 = khoangCach * (CGFloat(index) + 1)
            let x2 = widthView * CGFloat(index)
            var x = x1 + x2
            var y = khoangCach
            
            if x >= UIScreen.main.bounds.width {
                let indexWidth = index % 3
                let x1 = khoangCach * (CGFloat(indexWidth) + 1)
                let x2 = widthView * CGFloat(indexWidth)
                let indexHeight = index / 3
                x = x1 + x2
                y = khoangCach * (CGFloat(indexHeight) + 1) + 120 * CGFloat(indexHeight)
            }
            let userView: UIView = createUserView(frame: CGRect(x: x, y: y, width: widthView, height: 120), name: names[index])
            view.addSubview(userView)
        }
    }
    
    func createUserView(frame: CGRect, name: String) -> UIView {
        let userView = UIView(frame: frame)
        
        let frame = CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 20)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        userView.addSubview(userAvatar)
        
        //Add user name
        let Name = UILabel(frame: CGRect(x: 0, y: userView.bounds.height - 20, width: userView.bounds.width, height: 20))
        Name.text = name
        Name.backgroundColor = .lightGray
        Name.textColor = .blue
        userView.addSubview(Name)
        
        //Add button
        let button = UIButton(frame: frame)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        gesture.name = name
        button.addGestureRecognizer(gesture)
        button.backgroundColor = .clear
        userView.addSubview(button)
        return userView
    }
    
    // MARK: - Objc functions
    @objc func buttonDidClick(sender: UIGestureRecognizer){
        if let name = sender.name {
            print(name)
        }
    }
}
