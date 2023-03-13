//
//  UserViewController.swift
//  GBShop
//
//  Created by Елена Русских on 13.03.2023.
//

import UIKit

class UserViewController: UIViewController {
    //MARK: Variables
    private var rootView = UserRootView()
    let auth = RequestFactory().makeAuthRequestFactory()
    var gender: String = "m"
    let userDefaults = UserDefaults.standard
    
    //MARK: Objc methods
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
    
    @objc private func changeUserData() -> Void {
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
        auth.changeUserData(idUser: id, username: name, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { response in
            switch response.result {
            case .success(let changeUserData):
                print(changeUserData)
                self.saveUserData(name: name, email: email, password: password, creditCard: creditCard, bio: bio, id: id, gender: self.gender)
                DispatchQueue.main.async {
                    self.successChangeData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
    
    //MARK: Private methods
    private func parseId(idString: String) -> Int {
        Int(idString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) ?? 0
    }
    
    private func successChangeData(){
        let alert = UIAlertController(title: "It's done!", message: "You have successfully change data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        })
        )
        present(alert, animated: true)
        return
    }
    
    private func getGender() -> Int {
        if userDefaults.string(forKey: "gender") == "m" {
            return 0
        } else {
            return 1
        }
    }
    
    private func setRootViewSubviews() {
        rootView.userId.text = "Your id:\(String(userDefaults.integer(forKey: "id")))"
        rootView.bio.text = userDefaults.string(forKey: "bio")
        rootView.genderSegment.selectedSegmentIndex  = getGender()
        rootView.nameTextFieldView.text = userDefaults.string(forKey: "name")
        rootView.emailTextFieldView.text = userDefaults.string(forKey: "email")
        rootView.passwordTextFieldView.text = userDefaults.string(forKey: "password")
        rootView.creditCardView.text = userDefaults.string(forKey: "creditCard")
    }
    
    private func saveUserData(name: String, email: String, password: String, creditCard: String, bio: String, id: Int, gender: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(name, forKey: "name")
        userDefaults.set(password, forKey: "password")
        userDefaults.set(email, forKey: "email")
        userDefaults.set(creditCard, forKey: "creditCard")
        userDefaults.set(bio, forKey: "bio")
        userDefaults.set(id, forKey: "id")
        userDefaults.set(gender, forKey: "gender")
    }
    
    
    override func loadView() {
        super.loadView()
        view = rootView
        view.backgroundColor = .white
        setRootViewSubviews()
        rootView.animateChangeButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.changeButton.addTarget(self, action: #selector(changeUserData), for: .touchUpInside)
        rootView.genderSegment.addTarget(self, action: #selector(filterApply), for: .valueChanged)
        
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
