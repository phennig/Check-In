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

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    


    // Later use camelcased variables plz
    // no
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var TeacherLabel: UILabel!
    @IBOutlet weak var TeacherPicker: UIPickerView!
    @IBOutlet weak var PeriodoPicker: UIPickerView!
    @IBOutlet weak var PeriodLabel: UILabel!
    let period = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let teachers = ["Hennig", "Reidy", "TEacher3", ".kjawkb.avklj"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeacherPicker.dataSource = self
        TeacherPicker.delegate = self
        PeriodoPicker.dataSource = self
        PeriodoPicker.delegate = self
//         sendEmail()
        TeacherLabel.text = ""
        PeriodLabel.text = ""
       
    }
    func numberOfComponents(in pickerView: UIPickerView ) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var lol : Any?
        
        if pickerView == TeacherPicker
        {
            lol = teachers[row]
        }
        if pickerView == PeriodoPicker
        {
            lol = period[row]
        }
        
        return lol as! String
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
        var lol : Any?
        if pickerView == TeacherPicker
        {
            lol = teachers.count
        }
        if pickerView == PeriodoPicker
        {
            lol =  period.count
        }
        
        return lol as! Int
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
       if pickerView == TeacherPicker
       {
            TeacherLabel.text = teachers[row]
       }
       if pickerView == PeriodoPicker
       {
            PeriodLabel.text = period[row]
       }
       
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
        nvc.period = PeriodLabel.text!
        nvc.teacher = TeacherLabel.text!
    }
    
}

        // Dan : - )
        // Moe : - /
