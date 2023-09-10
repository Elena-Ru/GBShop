//
//  ReviewTableViewCell.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    //MARK: Variables
    static let identifier = "ReviewCell"
    
    //MARK: Subviews
    var idLabel = LabelDarkGreen()
    var reviewLabel = LabelDarkGreen()
    
    //MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(idLabel)
        addSubview(reviewLabel)
        
        NSLayoutConstraint.activate([
            idLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            idLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            
            reviewLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            reviewLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

