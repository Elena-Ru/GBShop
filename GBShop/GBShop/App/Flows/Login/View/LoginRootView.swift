//
//  LoginRootView.swift
//  GBShop
//
//  Created by Елена Русских on 03.03.2023.
//

import UIKit

class LoginRootView: UIView {
    //MARK: Subviews
    private let logo : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let slogan: UILabel = {
        let label = UILabel()
        label.text = "Dive into freshness!"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.tintColor = .brandDarkGreen
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let loginTextFieldView = CustomTextField(title: "Login", image: "person")
    
     let passwordTextFieldView: CustomTextField = {
        let textField = CustomTextField(title: "Password", image: "lock")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton = PurpleRoundedButton(title: "LOGIN")
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Still have no account?"
        label.textAlignment = .center
        return label
    }()
    
    let singUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
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
    func setupScrollView(){
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
        contentView.addSubview(logo)
        contentView.addSubview(slogan)
        
        let textFieldStack = UIStackView(arrangedSubviews: [loginTextFieldView, passwordTextFieldView])
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.distribution = .fillEqually
        textFieldStack.setCustomSpacing(20, after: loginTextFieldView)
        textFieldStack.axis = .vertical
        textFieldStack.addSubview(passwordTextFieldView)
        textFieldStack.addSubview(loginTextFieldView)
        contentView.addSubview(textFieldStack)
        contentView.addSubview(loginButton)

        let signUpStack = UIStackView(arrangedSubviews: [signUpLabel, singUpButton])
        signUpStack.translatesAutoresizingMaskIntoConstraints = false
        signUpStack.distribution = .fillEqually
        signUpStack.axis = .vertical
        signUpStack.addSubview(signUpLabel)
        signUpStack.addSubview(singUpButton)
        contentView.addSubview(signUpStack)
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            logo.widthAnchor.constraint(equalToConstant: 200),
            logo.heightAnchor.constraint(equalToConstant: 200),
            
            slogan.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            slogan.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            textFieldStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textFieldStack.topAnchor.constraint(equalTo: slogan.bottomAnchor, constant: 40),
            textFieldStack.widthAnchor.constraint(equalToConstant: 250),
            textFieldStack.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 100),

            signUpStack.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpStack.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
            signUpStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200)
        ])
    }
    
    //MARK: Animations
    func animateLogoAppearing() {
        logo.transform = CGAffineTransform(rotationAngle: .pi)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut , animations: {
            self.logo.transform = CGAffineTransform(rotationAngle: 2 * .pi)
        })
    }
    
    func animateTextFieldAppearing() {
        loginTextFieldView.transform = CGAffineTransform(translationX: -300, y: -30)
        self.layoutIfNeeded()
        _ = loginTextFieldView.center
        UIView.animateKeyframes(withDuration: 1, delay: 0,options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.loginTextFieldView.transform = CGAffineTransform(translationX: 0, y: -60)
                self.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.loginTextFieldView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.layoutIfNeeded()
            }
        }
    }
    
    func animatePasswordTextFieldAppearing() {
        passwordTextFieldView.transform = CGAffineTransform(translationX: -300, y: -30)
        self.layoutIfNeeded()
        _ = passwordTextFieldView.center
        UIView.animateKeyframes(withDuration: 1, delay: 0,options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.passwordTextFieldView.transform = CGAffineTransform(translationX: 0, y: -60)
                self.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.passwordTextFieldView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.layoutIfNeeded()
            }
        }
    }
}
