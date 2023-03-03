//
//  LoginViewController.swift
//  GBShop
//
//  Created by Елена Русских on 07.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Variables
    private var rootView = LoginRootView()
    let auth = RequestFactory().makeAuthRequestFactory()
    
    //MARK: Objc functions
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        rootView.scrollView.contentInset = contentInsets
        rootView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        rootView.scrollView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        rootView.scrollView.endEditing(true)
    }
    
    @objc func login(){
        guard let email = rootView.loginTextFieldView.text,
              let password = rootView.passwordTextFieldView.text,
              email.count > 0,
              password.count > 0 else {
            let alert = UIAlertController(title: "ERROR", message: "Login/password is not entered", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                alert.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true)
            })
            )
            present(alert, animated: true)
            return
        }
        
        auth.login(userName: email, password: password) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        rootView.scrollView.addGestureRecognizer(hideKeyboardGesture)
        rootView.animateLogoAppearing()
        rootView.animateTextFieldAppearing()
        rootView.animatePasswordTextFieldAppearing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        rootView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown),
                                               name:UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
}

