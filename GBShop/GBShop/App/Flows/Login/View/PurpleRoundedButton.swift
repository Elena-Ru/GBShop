//
//  PurpleRoundedButton.swift
//  GBShop
//
//  Created by Елена Русских on 10.03.2023.
//

import UIKit

class PurpleRoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel?.tintColor = .white
        layer.cornerRadius = 25
        layer.borderColor = UIColor.lightGray.cgColor
        layer.backgroundColor = UIColor.brandDarkPurple.cgColor
        layer.borderWidth = 2
        layer.shadowRadius = 4
        layer.masksToBounds = false
        clipsToBounds = true
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
