//
//  ViewController.swift
//  Check In
//
//  Created by Timothy P. Hennig on 12/17/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var locationPickerView: UIPickerView!
    
     var checkInLocations = ["Knights' Learning Center", "Commons", "Math Science Resource Room", "Lunch Room","Other"]
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
    //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: ViewController.keyboard, object: <#T##Any?#>)
       }
        //Work in process for text field - Arslan
       
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return checkInLocations.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let titleRow = checkInLocations[row]
            return titleRow
            
        }
        
        @objc func keyboardWillChange(notification: Notification)
        {
            print("JELP \(notification.name.rawValue)")
        }
        //work in progress - Arslan

    }

        // Dan : - )
