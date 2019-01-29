//
//  LoginVC.swift
//  LibraryApp
//
//  Created by Alper on 29.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {

    
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
    
    
    @IBAction func LoginBtnPressed(_ sender: UIButton) {
        loginUser()
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
    
    //MARK: Helper Functions
    //MARK: Checking user from database
    func checkUser( email: String, password: String){
        
        let db = Firestore.firestore()
        db.collection("users").getDocuments { (queryShot, error) in
            
            if let err = error {
                print("Error getting documents: \(err)")
            } else {
                for document in queryShot!.documents {
                    
                    let userDic = document.data()
                    
                    let userEmail = userDic["userEmail"] as! String
                    let userPass = userDic["password"] as! String
                    
                    if email == userEmail && password == userPass  {
                        if self.statute == "Admin" {
                            print("Admin")
                            self.performSegue(withIdentifier: "toAdminVC", sender: nil)
                        } else if self.statute == "Member" {
                            print("Member")
                            self.performSegue(withIdentifier: "toMemberVC", sender: nil)
                        }
                    } 
                }
            }
        }
    }
    
    
    //MARK: Function for login to Firebase Authentacation
    func loginUser(){
        
        guard let email = emailTextField.text else { return}
        
        guard let password = passwordTextField.text else { return}
        // Check email and password is empty or not
        if email != "" && password != "" {
            
            checkUser(email: email, password: password)
            
        } else {
            showAlert(on: self, title: "Warning", message: "Email and Password must be filled")
        }
    }
        
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
}


