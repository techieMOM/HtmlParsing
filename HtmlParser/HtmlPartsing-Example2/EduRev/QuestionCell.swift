//
//  QuestionCell.swift
//  EduRev
//
//  Created by SOWJI on 13/11/20.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var answer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
