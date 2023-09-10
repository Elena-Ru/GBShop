//
//  LabelDarkGreen.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import UIKit

class LabelDarkGreen: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        tintColor = .brandDarkGreen
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

