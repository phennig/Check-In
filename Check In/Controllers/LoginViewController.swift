//
//  ViewController.swift
//  Check In
//
//  Created by Timothy P. Hennig on 12/17/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import FirebaseFirestore
import MessageUI

class LoginViewController: UIViewController, MFMailComposeViewControllerDelegate {

    // Later use camelcased variables plz
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// - Authors: Arslan Khan, Muhammet Balsoy
    @IBAction func LogInButton(_ sender: UIButton) {
        // Fixed it for ya – Muhammet
        if let email = EmailTextField.text, let password = PasswordTextField.text {
            print(email, password)
        } else {
            print("Email or password is empty")
        }
    }
    
    /// - Authors: Arslan Khan
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! MainViewController
        nvc.email = EmailTextField.text!
    }
    
}

        // Dan : - )
        // Moe : - )
