//
//  StudentViewController.swift
//  Check In
//
//  Created by period2 on 12/18/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import FirebaseFirestore

class StudentViewController: UIViewController, UITextFieldDelegate {
    var email : Any?
    var teacher = ""
    var period = ""

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var klcOutlet: UIButton!
    @IBOutlet weak var commonsOutlet: UIButton!
    @IBOutlet weak var lunchOutlet: UIButton!
    @IBOutlet weak var msrOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(email, 5)
    }

    @IBAction func klcButton(_ sender: UIButton) {
        locationAlert(selected: "KLC")
    }
    
    @IBAction func commonsButton(_ sender: UIButton) {
        locationAlert(selected: "Commons")
    }
    
    @IBAction func lunchButton(_ sender: UIButton) {
        locationAlert(selected: "Cafe")
    }
    
    @IBAction func msrButton(_ sender: UIButton) {
        locationAlert(selected: "M.S.R.R")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func locationAlert(selected:String) {
        let alert = UIAlertController(title: "Your location", message: selected, preferredStyle: .alert)
        let confirmButton =  UIAlertAction(title: "Confirm Location", style: .default) { (action) in
            //send location to Firebase
            let db = Firestore.firestore()
            db.collection("Students").addDocument(data: ["Email" : self.email, "Location" : selected, "Teacher" : self.teacher, "Period" : self.period])
            
        }
        let declineButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(confirmButton)
        alert.addAction(declineButton)
        present(alert, animated: true, completion: nil)
    }
}
