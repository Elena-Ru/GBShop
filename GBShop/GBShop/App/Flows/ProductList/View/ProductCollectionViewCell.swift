//
//  ProductCollectionViewCell.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    //MARK: Subviews
    var productId = LabelDarkGreen()
    
    var productName : LabelDarkGreen = {
        let label = LabelDarkGreen()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    var priceLabel : LabelDarkGreen = {
        let label = LabelDarkGreen()
        label.text = "Price"
        return label
    }()
    
    var productPrice: UILabel = {
        let label = UILabel()
        label.textColor = .brandLightGreen
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Privat functions
    private func configure() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.brandLightGreen.cgColor
        layer.masksToBounds = true
    }
    
    private func setupLayout() {
        addSubview(productId)
        addSubview(productName)
        
        let priceStack = UIStackView(arrangedSubviews: [priceLabel, productPrice])
        priceStack.translatesAutoresizingMaskIntoConstraints = false
        priceStack.distribution = .fillEqually
        priceStack.axis = .horizontal
        priceStack.addSubview(priceLabel)
        priceStack.addSubview(productPrice)
        addSubview(priceStack)
        
        NSLayoutConstraint.activate([
            productId.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            productId.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            productName.centerXAnchor.constraint(equalTo: centerXAnchor),
            productName.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            priceStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            priceStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            priceStack.widthAnchor.constraint(equalTo: widthAnchor, constant: -20)
        ])
    }
}
