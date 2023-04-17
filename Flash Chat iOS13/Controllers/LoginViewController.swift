//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                
                if error != nil {
                    print("Error occurred: \(error!)")
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextfield {
            //TODO
            print("Email entered")
        } else if textField == passwordTextfield {
            print("Password entered")
        } else {
            
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != ""){
            //When text field has some text in it
            //And the user press the Search button or clicks the return button in the keyboard
            return true
        } else {
            textField.placeholder = "Type in something"
            return false
        }
    }
}
