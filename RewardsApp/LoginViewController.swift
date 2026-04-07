//
//  ViewController.swift
//  RewardsApp
//
//  Created by Daniel P on 2026-04-06.
//
//  Principal Author: Daniel Perusse
//  Description: Application login screen

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {

    //outlets for login
    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    //lets us interact with coredata
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //disable login button on load
        btnLogin.isEnabled = false
        
        //for return button functionality
        textFieldUsername.delegate = self
        textFieldPassword.delegate = self
        
    }
    
    //wipe out current login when this view is navigated to
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CurrentLogin.username = ""
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
    
    //main login functionality using coredata
    func loginUser(username: String, password: String) {
        
        //find if the username exists and log them in
        let request: NSFetchRequest<Users> = Users.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", username)
        //limit to only 1 user
        request.fetchLimit = 1
        
        do {
            let users = try context.fetch(request)
            //check if user exists then check for valid credentials
            if let user = users.first {
                if user.password == password {
                    
                    //navigate to main menu and pass over the logged in user for reference
                    let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    //let other screens access the user
                    CurrentLogin.username = username
                    self.navigationController?.pushViewController(navigateToVC, animated: true)
                    
                } else {
                    //notify of incorrect password
                    let alert = UIAlertController(title: "User Login", message: "Password is incorrect!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    present(alert, animated: true)
                }
            } else {
                //notify of non-existant account
                let alert = UIAlertController(title: "User Login", message: "Username does not exist. Please register!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        } catch {
            //in case something goes wrong
            let alert = UIAlertController(title: "User Login", message: "Error with request", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
        
    }

    //let user login to main menu
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        
        //fetch input from labels to pass into func
        let username = textFieldUsername.text!
        let password = textFieldPassword.text!
        
        //run our login func
        loginUser(username: username, password: password)
    }
    
    //let user register if no account
    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        //Needed for navigation to show screen
        let navigateToVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(navigateToVC, animated: true)
    }
}

