//
//  ViewController.swift
//  HW-2.3
//
//  Created by Виталий Подшибякин on 28.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    private let userName = "user"
    private let password = "password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loginViewController = segue.destination as? WelcomeViewController else {return}
        loginViewController.loginText = userName
    }
    
    @IBAction func logInButton() {
        if userNameTextField.text != userName || passwordTextfield.text != password {
            showAlert(with: "Error", and: "Invalid login or password")
            passwordTextfield.text = ""
        }
        }

    @IBAction func forgotLoginButton() {
        showAlert(with: "Oops!", and: "Your login is '\(userName)'")
        }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Oops!", and: "Your login is '\(password)'")
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




