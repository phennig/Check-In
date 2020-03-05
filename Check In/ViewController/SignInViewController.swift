//
//  SignInViewController.swift
//  Check In
//
//  Created by period5 on 2/13/20.
//  Copyright © 2020 Timothy P. Hennig. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class SignInViewController: UIViewController
{

    @IBOutlet weak var Background: UIView!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var Next: UIButton!
    var Studentname = ""
    var Studentemail = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
      //  Next.isHidden = true
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
       

        
        let user = Auth.auth().currentUser
        if let user = user
        {
                  
            Studentname = user.displayName as! String
            Studentemail = user.email as! String
            print(Studentemail)
          //  self.performSegue(withIdentifier: "GO", sender: self)
                
        }
       
        Background.layer.cornerRadius = 20
     
        
    }
    @IBAction func NextButton(_ sender: UIButton)
    {
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! ViewController
        nvc.Passingemail = Studentemail
        nvc.Passingname = Studentname
        
    }
    
    

}
