//
//  AboutMeViewController.swift
//  About me
//
//  Created by Виталий Подшибякин on 02.02.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    @IBOutlet var definitionLabel: UILabel!
    
    var definitionText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definitionLabel.text = definitionText
    }
}
