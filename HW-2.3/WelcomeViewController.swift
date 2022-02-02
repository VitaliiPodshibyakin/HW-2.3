//
//  LoginViewController.swift
//  HW-2.3
//
//  Created by Виталий Подшибякин on 28.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var loginTextField: UILabel!
    
    var loginText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = "Welcome, \(loginText)"
    }
}
