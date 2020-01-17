//
//  UIKit+Extension.swift
//  Check In
//
//  Created by Fatih Balsoy on 1/17/20.
//  Copyright © 2020 Timothy P. Hennig. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

extension UITableView {
    func reloadData(with animation: UITableView.RowAnimation = .automatic) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}

extension UIStatusBarStyle {
    static var black: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        }
        return .default
    }
}

extension UIViewController {
    /// Equivalent of the Android back button
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension UIApplication {
    public var isSplitOrSlideOver: Bool {
        guard let w = self.delegate?.window, let window = w else { return false }
        return !window.frame.equalTo(window.screen.bounds)
    }
}

extension UIView{
    var identifier: String {
        get {
            return self.accessibilityIdentifier ?? ""
        }
        set {
            self.accessibilityIdentifier = newValue
        }
    }
    
    /// Sets a nib for the specified UIView name
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    /// Moves UIView according to the keyboard position
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(UIView.keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: NSNotification) {
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let curFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y
        
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y+=deltaY
            
        },completion: nil)
    }
    
    func addTopBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}

extension UIImageView {
    /// Download and set an image from a given URL
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    /// Download and set an image from a given URL
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

extension UILabel {
    var fontSize: CGFloat {
        set {
            self.font = UIFont(name: self.font!.fontName, size: newValue)
        }
        get {
            return self.font!.pointSize
        }
    }
    var fontFamily: String {
        set {
            self.font = UIFont(name: newValue, size: self.font!.pointSize)
        }
        get {
            return self.font!.fontName
        }
    }
}
