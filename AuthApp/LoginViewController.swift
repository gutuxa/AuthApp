//
//  LoginViewController.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordBotton: UIButton!
    
    private let username = "user"
    private let password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 5
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = usernameTF.text ?? ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if usernameTF.text == username && passwordTF.text == password {
            return true
        } else {
            showAlert(message: "Wrong username or password")
            return false
        }
    }
    
    @IBAction func forgotButtonTouched(_ sender: UIButton) {
        if sender == forgotUsernameButton {
            showAlert(message: "Your username is \"\(username)\"")
        } else {
            showAlert(message: "Your password is \"\(password)\"")
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

