//
//  WelcomeViewController.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greatingLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 5
        greatingLabel.text = "Hello, \(username)! 👋"
    }
}
