//
//  LoginViewController.swift
//  ForFit
//
//  Created by Rubens Barbosa on 18/10/2018.
//  Copyright © 2018 Rubens Barbosa. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputUsername.text = "rubens.ifce@gmail.com"
        inputPassword.text = "@rbns32#"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func CreateAccount(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: inputUsername.text!, password: inputPassword.text!) { (user, error) in
            
            if error != nil {
                self.login()
            } else {
                print("User Created")
                self.login()
            }
        }
        
    }
    
    func login() {
        
        let username = inputUsername.text!
        let password = inputPassword.text!
        
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            
            if error != nil {
                print("Incorrect")
            } else {
                print("HAEA")
            }
            
        }
        
    }
    

}
