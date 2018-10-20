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
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        inputUsername.text = "rubens.ifce@gmail.com"
        inputPassword.text = "@rbns32#"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
