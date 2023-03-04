//
//  LoggedInViewController.swift
//  LoginPage
//
//  Created by Elizabeth on 28/02/2023.
//

import UIKit

final class LoggedInViewController: UIViewController {
    
    @IBOutlet var welcomeUserLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        welcomeUserLabel.text = "Welcome, \(user.personalInfo.name)"
    }
    
}
