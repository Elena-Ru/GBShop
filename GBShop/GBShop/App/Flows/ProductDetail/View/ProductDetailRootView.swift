//
//  ProductDetailRootView.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import UIKit

class ProductDetailRootView: UIView {
    
    //MARK: Subviews
    var productName : LabelDarkGreen = {
        let label = LabelDarkGreen()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    var productPrice: UILabel = {
        let label = UILabel()
        label.textColor = .brandLightGreen
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var productDescription = LabelDarkGreen()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: Init
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Privat functions
    private func setupLayout() {
        let productInfoStack = UIStackView(arrangedSubviews: [productName, productPrice, productDescription])
        
        productInfoStack.translatesAutoresizingMaskIntoConstraints = false
        productInfoStack.distribution = .fillEqually
        productInfoStack.axis = .vertical
        productInfoStack.addSubview(productName)
        productInfoStack.addSubview(productPrice)
        productInfoStack.addSubview(productDescription)
        addSubview(productInfoStack)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            productInfoStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            productInfoStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            productInfoStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            productInfoStack.heightAnchor.constraint(equalToConstant: 200),
            
            tableView.topAnchor.constraint(equalTo: productInfoStack.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        ])
    }
    
    func configure(name: String, price: Int, description: String) {
        productDescription.text = description
        productName.text = name
        productPrice.text = "$ \(String(price))"
    }
}

