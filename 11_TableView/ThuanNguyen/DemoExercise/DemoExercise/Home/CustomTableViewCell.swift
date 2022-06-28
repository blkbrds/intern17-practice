//
//  CustomTableViewCell.swift
//  DemoExercise
//
//  Created by thuan.nguyen on 28/06/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var thumnailImage: UIImageView!
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var writeName: UILabel!

   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
    

