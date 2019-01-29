//
//  LoginVC.swift
//  LibraryApp
//
//  Created by Alper on 23.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit
import Firebase


class RegisterVC: UIViewController,UITextFieldDelegate {
    
    //MARK: Outlets for email and password
    @IBOutlet weak var emailTextField: LATextField!
    @IBOutlet weak var passwordTextField: LATextField!
    
    //MARK: Outlets for admin and member labels
    @IBOutlet weak var adminLabel: UILabel!
    @IBOutlet weak var memberLabel: UILabel!
    
    //MARK: Variables 
    var countAdmin = 0
    var countMember = 0
    var statute = ""
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegations of email and password textFields
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        [adminLabel,memberLabel].forEach{$0.isHidden = true }
        
      
    }
    
    //MARK: Action for Register Button
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        registerUser()
    }

    //MARK: Actions for checkboxes
    @IBAction func checkBoxForAdminPressed(_ sender: UIButton) {
        
        if countAdmin == 0 {
            
            adminLabel.isHidden = false
            statute = "Admin"
            countAdmin += 1
            
        } else if countAdmin == 1 {
            
            adminLabel.isHidden = true
            countAdmin -= 1
        }
        
        if sender.isSelected {
            
            sender.isSelected = false
            
        } else {
            sender.isSelected = true
            
        }
    }
    
    @IBAction func checkBoxForMemberPressed(_ sender: UIButton) {
        
        if countMember == 0 {
            
            memberLabel.isHidden = false
            statute = "Member"
            countMember += 1
        } else if countMember == 1 {
            
            memberLabel.isHidden = true
            countMember -= 1
        }
        
        if sender.isSelected {
            
            sender.isSelected = false
            
        } else {
            sender.isSelected = true
            
        }
    }

    
    
    
    //MARK: Helper Function
    
    //MARK: Function for register to Firebase Authentication
    func registerUser() {
        
        guard let email = emailTextField.text else {
            print("There is a problem with Email TextField")
            return
        }
        
        guard let password = passwordTextField.text else {
            print("There is a problem with Password TextField")
            return
        }
        
        // Check if email and password is empty or not
        if email != "" && password != "" {
           
                    print("Successfully Registered")
                    // Check the user statute
                    if self.statute == "Admin" {
                        
                        self.putDataToDatabase(email: email, password: password, type: self.statute)
                        self.performSegue(withIdentifier: "toAdminVC", sender: nil)
                        
                    } else if self.statute == "Member" {
                        
                        self.putDataToDatabase(email: email, password: password, type: self.statute)
                        self.performSegue(withIdentifier: "toMemberVC", sender: nil)
                    }
                
            
        } else {
            
            showAlert(on: self, title: "Caution!", message: "Email and password must be filled")
        }
        
      
    }
    
    //MARK: put data into Firebase Cloud FireStore
    func putDataToDatabase(email: String, password: String, type: String){
        
        //Create Document Refence
        var ref:  DocumentReference? = nil
        //Create Firestore Database
        let db = Firestore.firestore()
        
        //Create UUID because we need to know it
        let userID = NSUUID().uuidString
        
        ref = db.document("users/\(userID)")
        
        let userData: [String:Any] = [
            "userEmail": email,
            "password": password,
            "type": type,
            "userID": userID
        ]
        
        ref?.setData(userData, completion: { (error) in
            if error != nil {
                print("There is a Error: \(String(describing: error)) ")
            } else {
                print("Saved it into database successfully")
            }
        })
    }
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}



