//
//  ViewController.swift
//  Check In
//
//  Created by Timothy P. Hennig on 12/17/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController
{
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let db = Firestore.firestore()
        let collection = db.collection("User")
        let doc = collection.document("Students")
        
        doc.getDocument { (document, err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                let data = document?.data() as! [String : [String : Any]]
                print(data)
            }
        }
    }

    //work in progress - Arslan
    @IBAction func LogInButton(_ sender: UIButton)
    {
        // Fixed it for ya – Muhammet
        let email = EmailTextField.text ?? ""
        let password = PasswordTextField.text ?? ""
        print(email, password)
    }
    
}

        // Dan : - )
