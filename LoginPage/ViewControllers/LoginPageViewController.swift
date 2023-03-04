//
//  ViewController.swift
//  LoginPage
//
//  Created by Elizabeth on 28/02/2023.
//

import UIKit

final class LoginPageViewController: UIViewController {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    private let user = User.getUserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.text = user.userName
        passwordTF.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabbarVc = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabbarVc.viewControllers else { return }
        
        viewControllers.forEach {
            if let firstVc = $0 as? LoggedInViewController {
                firstVc.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController
              guard let userInfoVC = userInfoVC as? AboutUserViewController else {
                    return
                }
                userInfoVC.user = user
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func logInTapped() {
        guard userNameTF.text == user.userName,
              passwordTF.text == user.password else {
            showAlert(
                withTitle: "Invalid login or password",
                message: "Please enter correct login and password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(withTitle: "Ooops!", message: "Your name is user :)")
            : showAlert(withTitle: "Ooops!", message: "Your password is user :)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue, sender: Any?) {
        passwordTF.text = ""
        userNameTF.text = ""
    }
    
}

extension LoginPageViewController {
    private func showAlert(withTitle title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

