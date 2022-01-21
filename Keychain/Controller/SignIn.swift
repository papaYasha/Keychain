//
//  SignIn.swift
//  Keychain
//
//  Created by Macbook on 5.12.21.
//

import UIKit
import Rswift

class SignIn: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var signInFormLabel: UILabel!
    @IBOutlet weak var dontHaveAnAccountButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - let, var
    
    let keychain: KeychainManager = KeychainManagerImp.shared
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
    }
    
    // MARK: - IBAction
    
    @IBAction func actionSignIn(_ sender: Any) {
        let password = passwordTextField.text ?? ""
        let login = loginTextField.text ?? ""
        if login.isEmpty || password.isEmpty {
            signInButton.shake()
        } else {
            if keychain.validatePassword(password, login) {
                presentContentController()
            } else {
                showAlertSheet()
            }
        }
    }
    
    @IBAction func actionShowPassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
    
    @IBAction func actionGoToSignUp(_ sender: Any) {
        presentSignUpController()
    }
    
    // MARK: - Function
    
    func localize() {
        signInFormLabel.text = R.string.localizable.signInForm_label()
        dontHaveAnAccountButton.setTitle(R.string.localizable.dontHaveAccoun_button(), for: .normal)
        signInButton.setTitle(R.string.localizable.signInbutton_button(), for: .normal)
    }
    
    func presentSignUpController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SignUp")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentContentController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "Content")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showAlertSheet() {
        let alert = UIAlertController(title: "Wrong password or login", message: "Try again", preferredStyle: .alert)
        
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
}

// MARK: - Extension UIButton

extension UIButton {
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 1
        shake.autoreverses = true
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: "position")
    }
}

