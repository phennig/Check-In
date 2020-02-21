//
//  ViewController.swift
//  Check In
//
//  Created by Timothy P. Hennig on 12/17/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // Later use camelcased variables plz
    // no
    // yes
    
 
    @IBOutlet weak var PeriodBack: UIView!
    @IBOutlet weak var Back: UIView!
    @IBOutlet weak var TeacherLabel: UILabel!
    @IBOutlet weak var TeacherPicker: UIPickerView!
    @IBOutlet weak var PeriodoPicker: UIPickerView!
    @IBOutlet weak var PeriodLabel: UILabel!
    let userDefaults = UserDefaults.standard
    let period = [" ","1", "2", "3", "4", "5", "6", "7", "8"]
    let teachers = [" ", "Hennig","Izenstark", "Kim","Page", "Reidy"]
    var Passingemail : Any?
    var Passingname : Any?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        TeacherPicker.dataSource = self
        TeacherPicker.delegate = self
        PeriodoPicker.dataSource = self
        PeriodoPicker.delegate = self
        TeacherLabel.text = ""
        PeriodLabel.text = ""
       
        if let array = userDefaults.array(forKey: "Array"){
            
            TeacherLabel.text = "\(array[0])"
            PeriodLabel.text = "\(array[1])"

        }
        
        print(Passingemail,3)

        PeriodBack.layer.cornerRadius = 20

        Back.layer.cornerRadius = 20
    }
    
    func numberOfComponents(in pickerView: UIPickerView ) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        var Selected : Any?
        
        if pickerView == TeacherPicker
        {
            Selected = teachers[row]
        }
        if pickerView == PeriodoPicker
        {
            Selected = period[row]
        }
        
        return Selected as! String
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
         
        var NumberOf : Any?
        if pickerView == TeacherPicker
        {
            NumberOf = teachers.count
        }
        if pickerView == PeriodoPicker
        {
            NumberOf =  period.count
        }
        
        return NumberOf as! Int
        
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
    
   
    @IBAction func nextView(_ sender: UIButton)
    {
       
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! StudentViewController
        
        nvc.email = Passingemail
        nvc.name = Passingname
        nvc.period = PeriodLabel.text!
        nvc.teacher = TeacherLabel.text!
    }
    
}

        // Dan : - )
        // Moe : - )
        // RC ; - )
