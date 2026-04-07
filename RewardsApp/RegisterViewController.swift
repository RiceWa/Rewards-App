//
//  RegisterViewController.swift
//  RewardsApp
//
//  Created by Daniel Perusse on 2026-04-07.
//
//  Principal Author: Daniel Perusse
//  Description: Register Page for new users
import UIKit
import CoreData

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    //outlets for user signup
    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirm: UITextField!
    
    @IBOutlet weak var btnSignup: UIButton!
    
    //lets us interact with coredata
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    //register the user into coredata
    func registerUser(username: String, password: String) {
        //object instance to set values
        let newUser = Users(context: context)
        newUser.username = username
        newUser.password = password
        newUser.points = 1000
        
        do {
            //save it to coredata
            try context.save()
            
            //notify user of success
            let alert = UIAlertController(title: "New User Signup", message: "Signup Successful!", preferredStyle: .alert)
            
            //make the ok button return to previous screen
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            
            //actually push it to user
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        } catch {
            //in case something goes wrong with registration
            let alert = UIAlertController(title: "New User Signup", message: "Error Signing Up. Please Try Again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    //checks for existing user by username
    func isRegistered(username: String, password: String) {
        
        //build our request to add our username check
        let request: NSFetchRequest<Users> = Users.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@", username)
        //limit to only 1 user
        request.fetchLimit = 1
        
        do {
            //find user
            let users = try context.fetch(request)
            if users.count > 0 {
                
                //notify user of take username
                let alert = UIAlertController(title: "New User Signup", message: "Username is already taken! Please try a different username.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            } else {
                //continue with user registration
                registerUser(username: username, password: password)
            }
        } catch {
            //in case something goes wrong
            let alert = UIAlertController(title: "New User Signup", message: "Error Signing Up. Please Try Again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    //creates a new user and returns to login
    @IBAction func btnSignupPressed(_ sender: UIButton) {
        
        //IOS strong password popup can break the password fields. check for this
        if (textFieldPassword.text ?? "").isEmpty || (textFieldConfirm.text ?? "").isEmpty {
            
            //notify user of error
            let alert = UIAlertController(title: "New User Signup", message: "Error Signing Up. Please Try Again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            
        } else {
            //grab the inputs from the textfields
            let username = textFieldUsername.text!
            let password = textFieldPassword.text!
            
            //run our registration functions
            isRegistered(username: username, password: password)
        }
        

    }
}
