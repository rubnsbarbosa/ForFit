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
    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.layer.cornerRadius = 20.0
        // tfUsername.layer.borderColor = UIColor.white.cgColor
        
        inputUsername.text = "rubens.ifce@gmail.com"
        inputPassword.text = "@rbns32#"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func presentHome(){
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        controller.selectedViewController = controller.viewControllers?[2]
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func CreateAccount(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: inputUsername.text!, password: inputPassword.text!) { (user, error) in
            
            if error != nil {
                self.login()
                self.presentHome()
            } else {
                print("User Created")
                self.login()
                self.presentHome()
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
                print("Correct")
            }
        }
        
    }
    

}
