//
//  ViewController.swift
//  RewardsApp
//
//  Created by Daniel P on 2026-04-06.
//
//  Principal Author: Daniel Perusse
//  Description: Application login screen

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    //outlets for login
    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //disable login button on load
        btnLogin.isEnabled = false
        
        //for return button functionality
        textFieldUsername.delegate = self
        textFieldPassword.delegate = self
        
    }
    
    //changes return button functionality
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //automatically go to next field when done typing username
        //exit field otherwise
        if textField == textFieldUsername {
            textFieldPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //enables/disables login button depending on textfield state
    func checkFields() {
        if (textFieldUsername.text ?? "").isEmpty || (textFieldPassword.text ?? "").isEmpty {
            btnLogin.isEnabled = false
        } else {
            btnLogin.isEnabled = true
        }
    }

    //to run our checkFields func when editing
    @IBAction func textFieldUsernameChanged(_ sender: UITextField) {
        checkFields()
    }
    
    @IBAction func textFieldPasswordChanged(_ sender: UITextField) {
        checkFields()
    }

    //let user login to main menu
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
    
    //let user register if no account
    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        //Needed for navigation to show screen
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
}

