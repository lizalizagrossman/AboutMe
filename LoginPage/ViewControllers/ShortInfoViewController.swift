//
//  AboutMeViewController.swift
//  LoginPage
//
//  Created by Elizabeth on 03/03/2023.
//

import UIKit

class ShortInfoViewController: UIViewController {

    @IBOutlet var textInfoLabel: UITextView!
    
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        textInfoLabel.text = user.personalInfo.textInfo
    }

}
