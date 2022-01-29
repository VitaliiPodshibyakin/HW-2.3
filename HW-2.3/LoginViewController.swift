//
//  LoginViewController.swift
//  HW-2.3
//
//  Created by Виталий Подшибякин on 28.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginTextField: UILabel!
    
    var loginText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = loginText
    }

    @IBAction func logOutButton() {
        dismiss(animated: true) {
        }
    }
}
