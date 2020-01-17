//
//  StudentViewController.swift
//  Check In
//
//  Created by Kamil Skalnicki on 12/18/19.
//  Copyright © 2019 Timothy P. Hennig. All rights reserved.
//

import UIKit
import FirebaseFirestore
import SnapKit

class MainViewController:
    UIViewController,
    UITextFieldDelegate {
    
    var email = ""

    @IBOutlet weak var locationTextField: UITextField!
    
    let tableview = UITableView()
    let navigationBar: BlurView = {
        let blur = BlurView()
        blur.blurTintColor = .white
        return blur
    }()
    let navigationTitle: UILabel = {
        let label = UILabel()
        label.text = "Check-in"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 42)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        initializeTable()
        layout()
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

// MARK: *+UI.swift
extension MainViewController {
    /// - Authors: Muhammet Balsoy
    func layout() {
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(140)
        }
        
        navigationBar.addSubview(navigationTitle)
        navigationTitle.snp.makeConstraints { (make) in
            make.left.equalTo(navigationBar).offset(100)
            make.right.equalTo(navigationBar).offset(-100)
            make.bottom.equalTo(navigationBar).offset(-20)
        }
        
        view.insertSubview(tableview, belowSubview: navigationBar)
        tableview.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(view)
        }
    }
}

// MARK: *+Table.swift
extension MainViewController:
    UITableViewDelegate,
    UITableViewDataSource {
    
    func initializeTable() {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.dataSource = self
        tableview.delegate = self
        tableview.contentInset = UIEdgeInsets(top: 140, left: 85, bottom: 0, right: -85)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Test"
        cell.detailTextLabel?.text = "gg"
        cell.showsReorderControl = true
        return cell
    }
    
    
}
