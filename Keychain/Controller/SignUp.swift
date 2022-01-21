//
//  SignUp.swift
//  Keychain
//
//  Created by Macbook on 5.12.21.
//

import UIKit
import Rswift

class SignUp: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var signUpFormLabel: UILabel!
    @IBOutlet weak var loginTextFeild: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        localize()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    // MARK: - Function

    func localize() {
        signUpFormLabel.text = R.string.localizable.signUpForm_label()
        signUpButton.setTitle(R.string.localizable.signUpButton(), for: .normal)
        signInButton.setTitle(R.string.localizable.signInButtonFromSignUp_button(), for: .normal)
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardHeight / 2
            }
        }
    }
    
    @objc func kbWillHide() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
        
    }
    
    
    func presentContentController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "Content")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentSignInController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SignIn")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func showAlertSheet() {
        let alert = UIAlertController(title: "Duplicate login", message: "Choose other", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("You choose OK")
        }))
        
        self.present(alert, animated: true, completion: nil)
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func actionSignUp(_ sender: Any) {
        let login = loginTextFeild.text ?? ""
        if login.isEmpty {
            signUpButton.shake()
        } else {
            if KeychainManagerImp.shared.getPassword(login) != nil {
                showAlertSheet()
                return
            }
            if let password = passwordTextField.text, password.isEmpty == false, password == repeatPasswordTextField.text {
                KeychainManagerImp.shared.setPassword(password, login)
                presentContentController()
            }
        }
    }
    
    @IBAction func actionGoToSignIn(_ sender: Any) {
        presentSignInController()
    }
    
    @IBAction func actionTapHideKb(_ sender: Any) {
        loginTextFeild.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
}

// MARK: - Extension UITextFieldDelegate

extension SignUp: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
