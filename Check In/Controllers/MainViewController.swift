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

var _KNavHeight: CGFloat = 140
var _KNavCollapsedHeight: CGFloat = 100
var _KNavTitleSize: CGFloat = 42
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
        label.font = UIFont.boldSystemFont(ofSize: _KNavTitleSize)
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
            make.height.equalTo(_KNavHeight)
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.y
        let scrollWhenCollapsed = _KNavHeight - _KNavCollapsedHeight
        let percent = scroll / scrollWhenCollapsed
        
        print(scroll)
        
        // Expanded = -160
        if scroll <= scrollWhenCollapsed && scroll >= 0 {
            let size = _KNavTitleSize - 10 * percent
            navigationTitle.font = UIFont.boldSystemFont(ofSize: size)
        }
        
        if scroll <= scrollWhenCollapsed {
            navigationBar.snp.updateConstraints { (make) in
                make.height.equalTo(_KNavHeight - scroll)
            }
        } else {
            navigationBar.snp.updateConstraints { (make) in
                make.height.equalTo(_KNavCollapsedHeight)
            }
        }
    }
    
    func initializeTable() {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.dataSource = self
        tableview.delegate = self
        tableview.contentInset = UIEdgeInsets(top: _KNavHeight, left: 85, bottom: 50, right: -85)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 32
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "Test"
        cell.detailTextLabel?.text = "gg"
        cell.showsReorderControl = true
        return cell
    }
    
    
}
