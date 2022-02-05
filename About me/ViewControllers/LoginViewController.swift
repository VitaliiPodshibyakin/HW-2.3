//
//  ViewController.swift
//  HW-2.3
//
//  Created by Виталий Подшибякин on 28.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    // MARK: - Private properties
    let user = UserData.getPerson()
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else {return}
        
        for viewController in viewControllers {
               if let welcomeVC = viewController as? WelcomeViewController {
                   welcomeVC.loginText = "\(user.person.firstName) \(user.person.secondName)"
               } else if let navigationVC = viewController as? UINavigationController {
                   let aboutMeVC = navigationVC.topViewController as! AboutMeViewController
                   aboutMeVC.definitionText = user.person.definition
               }
            }
   }

    // MARK: IBActions
    @IBAction func logInButton() {
        if userNameTextField.text != user.user || passwordTextfield.text != user.password {
            showAlert(with: "Error", and: "Invalid login or password")
            passwordTextfield.text = ""
        }
        }

    @IBAction func forgotLoginButton() {
        showAlert(with: "Oops!", and: "Your login is '\(user.user)'")
        }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Oops!", and: "Your login is '\(user.password)'")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextfield.text = ""
        userNameTextField.text = ""
    }
    
}


// MARK: - Alerts
extension LoginViewController {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - Touches
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextfield.becomeFirstResponder()
        } else {
            logInButton()
            performSegue(withIdentifier: "showLoginVC", sender: nil)
        }
        return true
    }
}




