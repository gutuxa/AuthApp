//
//  JobsViewController.swift
//  AuthApp
//
//  Created by Oksana Tugusheva on 03.04.2021.
//

import UIKit

class JobsViewController: UIViewController {
    
    @IBOutlet var jobsTV: UITextView!
    
    var jobs: [Job]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Jobs"
        
        if let jobs = jobs {
            var text = ""
            
            for job in jobs {
                text += job.title + "\n" + job.description + "\n\n"
            }
            
            jobsTV.text = text
        }
    }

}
