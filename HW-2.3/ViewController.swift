//
//  ViewController.swift
//  HW-2.3
//
//  Created by Виталий Подшибякин on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logInButton() {
        if userNameTextField.text == "user", passwordTextfield.text == "password" {
        } else {
            showAlert(with: "Error", and: "Invalid login or password")
            passwordTextfield.text = ""
        }
        }

    @IBAction func forgotLoginButton() {
        showAlert(with: "Oops!", and: "Your login is 'user'")
        }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Oops!", and: "Your login is 'password'")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loginViewController = segue.destination as? LoginViewController else {return}
        loginViewController.loginText = "Hello, " + userNameTextField.text! + "!"
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextfield.text = ""
        userNameTextField.text = ""
    }
}


// MARK: - Alerts
extension ViewController {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - Touches
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
}


