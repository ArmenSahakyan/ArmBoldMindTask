//
//  ComradesTableViewCell.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/7/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit

class ComradesTableViewCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.shadowColor = UIColor.darkGray.cgColor
        backView.layer.shadowOffset = Theme.Sizes.shadow
        backView.layer.shadowRadius = 3
        backView.layer.shadowOpacity = 0.3
        backView.layer.cornerRadius = 20
        let fullString         = NSMutableAttributedString(string: "")
        let imageAttachment   = NSTextAttachment()
        let imageString       = NSAttributedString(attachment: imageAttachment)
        imageAttachment.image = UIImage(named: "placeholder.png")
        fullString.append(imageString)
        fullString.append(NSAttributedString(string: " 15 Arshakunyac ave, Yerevan,"))
        addressLabel.attributedText = fullString
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
