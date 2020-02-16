//
//  StudentViewController.swift
//  Check In
//
//  Created by period2 on 12/18/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class StudentViewController: UIViewController, UITextFieldDelegate {
    var email : Any?
    var name : Any?
    var teacher = ""
    var period = ""

    @IBOutlet weak var klcOutlet: UIButton!
    @IBOutlet weak var commonsOutlet: UIButton!
    @IBOutlet weak var lunchOutlet: UIButton!
    @IBOutlet weak var msrOutlet: UIButton!
    @IBOutlet weak var Other: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       print(email)
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
    
    func locationAlert(selected:String)
    {
        let alert = UIAlertController(title: "Your selected location:", message: selected, preferredStyle: .alert)
        let confirmButton =  UIAlertAction(title: "Confirm Location", style: .default) { (action) in
            //send location to Firebase
            
        let db = Firestore.firestore()
            db.collection("Student").document(self.email as! String).setData(["Email" : self.email,"Name" : self.name ,"Location" : selected, "Teacher" :self.teacher, "Period" : self.period])
         
        }
        let declineButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(confirmButton)
        alert.addAction(declineButton)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func Confirm(_ sender: UIButton)
    {
            var OtherLocation = Other.text!
            let alert = UIAlertController(title: "Is this where you'll Like to go? ", message: "\(OtherLocation)", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "No", style: .cancel , handler: nil)
            let confirmbutton = UIAlertAction(title: "Confirm", style: .default)
            { (action) in
            let db = Firestore.firestore()
                db.collection("Student").document(self.email as! String).setData(["Email" : self.email,"Name" : self.name, "Location" : OtherLocation, "Teacher" :self.teacher, "Period" : self.period])
                
            
                
    
            }
           
        alert.addAction(dismiss)
        alert.addAction(confirmbutton)
        present(alert, animated: true, completion: nil)
    }
}
