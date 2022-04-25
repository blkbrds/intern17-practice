//
//  Ex9Cell.swift
//  TableView
//
//  Created by tri.nguyen on 25/04/2022.
//

import UIKit

protocol Ex9CellDelegate: class {
    func viewCell(_ viewCell: Ex9Cell, needsPerform action: Ex9Cell.Action)
}

final class Ex9Cell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Properties
    var nameRow: String = ""
    var indexRow: Int = 0
    weak var delegate: Ex9CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAction
    @IBAction func tapmeButtonTouchUpInside(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.viewCell(self, needsPerform: .getData(name: nameRow, index: indexRow))
    }
    
    // MARK: - Public Function
    func setupCell(image: UIImage?, namelb: String, subtitlelb: String, index: Int) {
        thumbImageView.image = image
        nameLabel.text = namelb
        subtitleLabel.text = subtitlelb
        indexRow = index
        nameRow = namelb
    }
}

// MARK: - Extention
extension Ex9Cell {
    // MARK: - Define
    enum Action {
        case getData(name: String, index: Int)
    }
}
