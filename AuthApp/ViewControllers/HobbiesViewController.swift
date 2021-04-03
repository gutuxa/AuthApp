//
//  HobbiesViewController.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 03.04.2021.
//

import UIKit

class HobbiesViewController: UIViewController {
    
    @IBOutlet var hobbiesTV: UITextView!
    
    var hobbies: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Hobbies"

        if let hobbies = hobbies {
            hobbiesTV.text = hobbies
        }
    }

}
