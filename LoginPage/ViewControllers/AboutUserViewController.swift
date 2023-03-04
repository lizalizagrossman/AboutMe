//
//  AboutUserViewController.swift
//  LoginPage
//
//  Created by Elizabeth on 02/03/2023.
//

import UIKit

class AboutUserViewController: UIViewController {

    @IBOutlet var userAvatar: UIImageView! {
        didSet {
            userAvatar.layer.cornerRadius = userAvatar.frame.height / 2
        }
    }
    
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var favouriteAnimalLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var justNameLabel: UILabel!
    
    var user: User!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userAvatar.image = UIImage(named: user.personalInfo.photo)
        fullNameLabel.text = user.personalInfo.fullName
        favouriteAnimalLabel.text = user.personalInfo.favouriteAnimal
        jobLabel.text = user.personalInfo.job
        surnameLabel.text = user.personalInfo.surname
        justNameLabel.text = user.personalInfo.name
        
        view.addVerticalGradientLayer()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let userForShortInfo = segue.destination as? ShortInfoViewController else { return }
        userForShortInfo.user = user
    }
    
}
