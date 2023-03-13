//
//  CustomTextField.swift
//  GBShop
//
//  Created by Елена Русских on 03.03.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, image: String) {
        super.init(frame: .zero)
        placeholder = title
        borderStyle = .roundedRect
        autocapitalizationType = .none
        setLeftPaddingPoints(20)
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.brandGrey.cgColor
        let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let image = UIImage(systemName: image)
        imageView.image = image
        imageView.tintColor = .brandLightGreen
        imageView.contentMode = .scaleAspectFit
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        view.addSubview(imageView)
        leftViewMode = UITextField.ViewMode.always
        leftView = view
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
