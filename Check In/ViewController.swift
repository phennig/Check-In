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
                let data = document?.data()
                print(data)
            }
        }
        
      //  db.d
        
        
    }

    //work in progress - Arslan
    @IBAction func LogInButton(_ sender: UIButton)
    {
        var lol = EmailTextField.text
        var Password = PasswordTextField.text
        let db = Firestore.firestore()
        db.collection("User").addDocument(data: ["Name":  lol , "Password" : Password])


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! StudentViewController
        nvc.email = EmailTextField.text!
    }
    
}

        // Dan : - )
