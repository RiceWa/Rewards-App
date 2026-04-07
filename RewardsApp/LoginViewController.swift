//
//  ViewController.swift
//  RewardsApp
//
//  Created by Daniel P on 2026-04-06.
//
//  Principal Author: Daniel Perusse
//  Description: Application login screen

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //outlets for login
    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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

    //to run our checkFields func when done editing
    @IBAction func textFieldUsernameEditEnd(_ sender: UITextField) {
    }
    @IBAction func textFieldPasswordEditEnd(_ sender: UITextField) {
    }
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        //Needed for navigation to show screen
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "BarcodeViewController") as! BarcodeViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
}

