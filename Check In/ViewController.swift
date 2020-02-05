//
//  ViewController.swift
//  Check In
//
//  Created by Timothy P. Hennig on 12/17/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Later use camelcased variables plz
    // no
    // yes
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var TeacherLabel: UILabel!
    @IBOutlet weak var TeacherPicker: UIPickerView!
    @IBOutlet weak var PeriodoPicker: UIPickerView!
    @IBOutlet weak var PeriodLabel: UILabel!
    let period = ["1", "2", "3", "4", "5", "6", "7", "8"]
    let teachers = ["Hennig", "Reidy", "Kim", "Page"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeacherPicker.dataSource = self
        TeacherPicker.delegate = self
        PeriodoPicker.dataSource = self
        PeriodoPicker.delegate = self
        TeacherLabel.text = ""
        PeriodLabel.text = ""
       
        let userDefaults = UserDefaults.standard
        if let array = userDefaults.array(forKey: "Array"){
            EmailTextField.text = "\(array[0])"
            TeacherLabel.text = "\(array[1])"
            PeriodLabel.text = "\(array[2])"
            
        }
        
        print(Array<Any>.self).self
        //Work in progress
//        if TeacherLabel.text != "", PeriodLabel.text != "", EmailTextField.text != ""
//        {
//
//            if let nextvc = self.storyboard?.instantiateViewController(withIdentifier:
//            "paper")
//            {
//                let segue = UIStoryboardSegue()
//                let vc = segue.destination as? StudentViewController
//
//                vc?.email = EmailTextField
//
//                self.navigationController?.pushViewController(nextvc, animated: true)
//            }
          
            
//        }
     
    }
    
    func numberOfComponents(in pickerView: UIPickerView ) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var lol : Any?
        
        if pickerView == TeacherPicker{
            lol = teachers[row]
        }
        if pickerView == PeriodoPicker{
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
    
    /// - Authors: Arslan Khan, Muhammet Balsoy
    @IBAction func LogInButton(_ sender: UIButton) {
        // Fixed it for ya – Muhammet
        if let email = EmailTextField.text, let password = PasswordTextField.text {
            print(email, password)
        } else {
            print("Email or password is empty")
        }
        
        let defaults = UserDefaults.standard
        if let array1 = EmailTextField.text, let array2 = TeacherLabel.text, let array3 = PeriodLabel.text
        {
            let array = [array1, array2, array3]
            defaults.set(array, forKey: "Array")
            
            
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
        // Moe : - )
