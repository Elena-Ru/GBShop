//
//  RegisterViewController.swift
//  GBShop
//
//  Created by Елена Русских on 04.03.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: Variables
    private var rootView = RegisterRootView()
    let auth = RequestFactory().makeAuthRequestFactory()
    var gender: String = "m"
    
    //MARK: Objc methods
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
    @objc private func filterApply(segment: UISegmentedControl) -> Void {
        switch segment.selectedSegmentIndex {
        case 0:
            gender = "m"
        case 1:
            gender = "f"
        default:
            break
        }
    }
    
    @objc private func signUp() -> Void {
        guard let email = rootView.emailTextFieldView.text,
              let password = rootView.passwordTextFieldView.text,
              let name = rootView.nameTextFieldView.text,
              let creditCard = rootView.creditCardView.text,
              let bio = rootView.bio.text,
              let idString = rootView.userId.text,
              email.count > 0,
              password.count > 0,
              name.count > 0,
              creditCard.count > 0,
              bio.count > 0 else {
            let alert = UIAlertController(title: "ERROR", message: "Please, fill all the gaps", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            })
            )
            present(alert, animated: true)
            return
        }
        let id = parseId(idString: idString)
        auth.register(idUser: id, username: name, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    self.successSignUp()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
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
    
    //MARK: Private methods
    private func parseId(idString: String) -> Int {
        Int(idString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) ?? 0
    }
    
    private func successSignUp(){
        let alert = UIAlertController(title: "It's done!", message: "You have successfully signed up", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            alert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true)
        })
        )
        present(alert, animated: true)
        return
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
        view.backgroundColor = .white
        title = "Register"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.brandDarkGreen]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        _ = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        rootView.animateSignUpButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.genderSegment.addTarget(self, action: #selector(filterApply), for: .valueChanged)
        rootView.registerButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
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
