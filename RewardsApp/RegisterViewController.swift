//
//  RegisterViewController.swift
//  RewardsApp
//
//  Created by Daniel Perusse on 2026-04-07.
//
//  Principal Author: Daniel Perusse
//  Description: Register Page for new users
import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    //outlets for user signup
    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirm: UITextField!
    
    @IBOutlet weak var btnSignup: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //disable on load
        btnSignup.isEnabled = false
        
        //need this for enter/return key functionality
        textFieldUsername.delegate = self
        textFieldPassword.delegate = self
        textFieldConfirm.delegate = self
    }
    
    //changes return button functionality
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //automatically go to next field when done typing username
        //exit field otherwise
        if textField == textFieldUsername {
            textFieldPassword.becomeFirstResponder()
        } else if textField == textFieldPassword {
            textFieldConfirm.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //enables/disables login button depending on textfield state
    func checkFields() {
        if (textFieldUsername.text ?? "").isEmpty || (textFieldPassword.text ?? "").isEmpty || (textFieldConfirm.text ?? "").isEmpty || textFieldPassword.text != textFieldConfirm.text{
            btnSignup.isEnabled = false
        } else {
            btnSignup.isEnabled = true
        }
    }

    //to run checkfields while editing
    @IBAction func textFieldUsernameChanged(_ sender: UITextField) {
        checkFields()
    }
    
    @IBAction func textFieldPasswordChanged(_ sender: UITextField) {
        checkFields()
    }
    
    @IBAction func textFieldConfirmChanged(_ sender: UITextField) {
        checkFields()
    }
    
    //creates a new user and returns to login
    @IBAction func btnSignupPressed(_ sender: UIButton) {
        //notify user of success
        let alert = UIAlertController(title: "New User Signup", message: "Signup Successful!", preferredStyle: .alert)
        
        //make the ok button return to previous screen
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        //actually push it to user
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
