//
//  LoginViewController.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let username = "user"
    private let password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.delegate = self
        passwordTF.delegate = self
        
        loginButton.layer.cornerRadius = 5
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = usernameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func forgotButtonTouched(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(message: "Your username is \"\(username)\"")
        } else {
            showAlert(message: "Your password is \"\(password)\"")
        }
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTF.text != username || passwordTF.text != password {
            showAlert(message: "Wrong username or password")
            passwordTF.text = ""
        }
        
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        
        return true
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

