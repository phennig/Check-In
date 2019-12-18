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
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    


}

