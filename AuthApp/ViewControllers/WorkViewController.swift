//
//  WorkViewController.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 03.04.2021.
//

import UIKit

class WorkViewController: UIViewController {

    @IBOutlet var workTV: UITextView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Work"

        if let person = person {
            workTV.text = person.skills
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jobsVC = segue.destination as? JobsViewController else { return }
        guard let person = person else { return }
        jobsVC.jobs = person.jobs
    }
}
