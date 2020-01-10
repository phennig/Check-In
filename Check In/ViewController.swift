//
//  ViewController.swift
//  Check In
//
//  Created by Timothy P. Hennig on 12/17/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
    //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: ViewController.keyboard, object: <#T##Any?#>)
       }
        //Work in process for text field - Arslan
       
        
       
        
        @objc func keyboardWillChange(notification: Notification)
        {
            print("JELP \(notification.name.rawValue)")
        }
        //work in progress - Arslan

    }

        // Dan : - )
