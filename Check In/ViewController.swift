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

class ViewController: UIViewController
{
   
  
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let ComposeVC = MFMailComposeViewController()
        
        
        
        
      //  db.d
        
        
    }

    //work in progress - Arslan
    @IBAction func LogInButton(_ sender: UIButton)
    {
        // Fixed it for ya – Muhammet
        let Email = EmailTextField.text
        let password = PasswordTextField.text
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! StudentViewController
        nvc.email = EmailTextField.text!
    }
    
}

        // Dan : - )
