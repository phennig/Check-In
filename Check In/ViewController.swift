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

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    // Later use camelcased variables plz
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** Uncomment if you want to present ComposeVC on real device.
            Mail controller is not supported on the simulator.
            This fixes the AppDelegate crash – Muhammet
         */
//         sendEmail()
    }
    
    /// - Authors: Muhammet Balsoy, Paul Hudson
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["teacher@example.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    /// - Authors: Muhammet Balsoy, Paul Hudson
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
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
        let nvc = segue.destination as! StudentViewController
        nvc.email = EmailTextField.text!
    }
    
}

        // Dan : - )
        // Moe : - /
