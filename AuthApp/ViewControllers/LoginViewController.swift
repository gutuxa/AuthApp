//
//  LoginViewController.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IB Otlets
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    // MARK: - Private properties
    private let user = User.getUser()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.delegate = self
        passwordTF.delegate = self
        
        loginButton.layer.cornerRadius = 5
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        let person = user.getPerson()
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.person = person
            } else if let navigationVC = viewController as? UINavigationController {
                if let workVC = navigationVC.topViewController as? WorkViewController {
                    workVC.person = person
                } else if let hobbiesVC = navigationVC.topViewController as? HobbiesViewController {
                    hobbiesVC.hobbies = person.hobbies
                }
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func forgotButtonTouched(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(message: "Your username is \"\(user.username)\"")
        } else {
            showAlert(message: "Your password is \"\(user.password)\"")
        }
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTF.text != user.username || passwordTF.text != user.password {
            showAlert(message: "Wrong username or password")
            passwordTF.text = ""
            return
        }
        
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    // MARK: - Private Methods
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard extentions
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        
        return true
    }
}

