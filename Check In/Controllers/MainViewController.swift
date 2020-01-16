//
//  StudentViewController.swift
//  Check In
//
//  Created by period2 on 12/18/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import FirebaseFirestore

class MainViewController:
    UIViewController,
    UITextFieldDelegate {
    
    var email = ""

    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //relocate the textfield to the top of the screen
        //locationTextField.position(from: , offset: )
        textField.resignFirstResponder()
        return true
    }
    
    func locationAlert(selected:String) {
        let alert = UIAlertController(title: "Your location", message: selected, preferredStyle: .alert)
        let confirmButton =  UIAlertAction(title: "Confirm Location", style: .default) { (action) in
            //send location to Firebase
            let db = Firestore.firestore()
            db.collection("Students").addDocument(data: ["Email" : self.email, "Location" : selected])
            
        }
        let declineButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(confirmButton)
        alert.addAction(declineButton)
        present(alert, animated: true, completion: nil)
    }
}
