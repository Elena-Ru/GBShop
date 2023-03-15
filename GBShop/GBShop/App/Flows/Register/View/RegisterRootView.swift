//
//  RegisterRootView.swift
//  GBShop
//
//  Created by Елена Русских on 04.03.2023.
//

import UIKit

class RegisterRootView: UIView {
    //MARK: Subviews
    let scrollView = UIScrollView()
    let contentView = UIView()
    let nameTextFieldView = CustomTextField(title: "Name", image: "person")
    let emailTextFieldView = CustomTextField(title: "Email", image: "mail")
    let creditCardView = CustomTextField(title: "Credit card", image: "creditcard")
    
    let userId: UILabel = {
        let label = UILabel()
        let id = UInt.random(in: 0...259000)
        label.text = "User id-\(id)"
        label.textAlignment = .center
        label.textColor = UIColor.brandDarkGreen
        return label
    }()
    
    let passwordTextFieldView: CustomTextField = {
        let textField = CustomTextField(title: "Password", image: "lock")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let genderSegment : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["🧔🏻", "👩🏻‍🦰"])
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    let bio : UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.brandGrey.cgColor
        textView.layer.cornerRadius = 20
        textView.layer.borderWidth = 2
        textView.autocorrectionType = .no
        textView.text = "Enter you bio"
        textView.textColor = .secondaryLabel
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.sizeToFit()
        textView.isScrollEnabled = true
        return textView
    }()
    
    let registerButton = PurpleRoundedButton(title: "SIGN UP")
    
    //MARK: Init
    init() {
        super.init(frame: CGRect())
        setupScrollView()
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Privat functions
    private func setupScrollView(){
        backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func createView() {
        setupLayout()
    }
    
    private func setupLayout() {
        let textFieldStack = UIStackView(arrangedSubviews: [userId, nameTextFieldView, passwordTextFieldView, emailTextFieldView, creditCardView])
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.distribution = .fillEqually
        textFieldStack.setCustomSpacing(20, after: userId)
        textFieldStack.setCustomSpacing(20, after: nameTextFieldView)
        textFieldStack.setCustomSpacing(20, after: passwordTextFieldView)
        textFieldStack.setCustomSpacing(20, after: emailTextFieldView)
        textFieldStack.axis = .vertical
        textFieldStack.addSubview(passwordTextFieldView)
        textFieldStack.addSubview(nameTextFieldView)
        textFieldStack.addSubview(emailTextFieldView)
        textFieldStack.addSubview(creditCardView)
        contentView.addSubview(textFieldStack)
        contentView.addSubview(genderSegment)
        contentView.addSubview(bio)
        contentView.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            textFieldStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textFieldStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            textFieldStack.widthAnchor.constraint(equalToConstant: 220),
            textFieldStack.heightAnchor.constraint(equalToConstant: 320),
            
            genderSegment.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 30),
            genderSegment.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            genderSegment.widthAnchor.constraint(equalTo: textFieldStack.widthAnchor),
            
            bio.topAnchor.constraint(equalTo: genderSegment.bottomAnchor, constant: 30),
            bio.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bio.widthAnchor.constraint(equalTo: textFieldStack.widthAnchor),
            bio.heightAnchor.constraint(equalToConstant: 200),
            
            registerButton.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200)
        ])
    }
    //MARK: Animations
    func animateSignUpButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        self.registerButton.layer.add(animation, forKey: nil)
    }
}
