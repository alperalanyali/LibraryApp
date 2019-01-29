//
//  AddNewMemberVC.swift
//  LibraryApp
//
//  Created by Alper on 26.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AddNewMemberVC: UIViewController, UITextFieldDelegate {

    
    //MARK: Outlets for TextFields
    
    @IBOutlet weak var newMemberEmailTextField: LATextField!
    @IBOutlet weak var newMemberType: LATextField!
    @IBOutlet weak var newMemberPasswordTextField: LATextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        [newMemberEmailTextField,newMemberType,newMemberPasswordTextField].forEach{$0?.delegate = self }
    }
    
    
    //MARK: Actions for Buttons
    @IBAction func addNewMemberPressed(_ sender: UIButton) {
        
        guard let newMemberEmail = newMemberEmailTextField.text else { return}
        
        guard let newMemberType = newMemberType.text else { return}
        
        guard let newMemberPassword = newMemberPasswordTextField.text else { return}
        
        createNewMember(email: newMemberEmail, password: newMemberPassword)
        putNewMemberData(email: newMemberEmail, password: newMemberPassword, type: newMemberType)
        
        cleanTextFields()
        
        dismiss(animated: true, completion: nil)
    }
    
  
    
    @IBAction func closePressed(_ sender: UIButton) {
        
        cleanTextFields()
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Helper Functions
    
    //MARK: Create New User Function
    func createNewMember(email: String, password: String){
        
        if email != "" && password != "" {
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    print("Error: \(error.debugDescription)")
                } else {
                    print("New Member Created Successfully")
                }
            }
        } else {
            showAlert(on: self, title: "Alert!", message: "Email and Password must be filled")
        }
        
    }
    
    func putNewMemberData(email:String, password: String, type: String){
        //Create Document Reference
        var ref: DocumentReference? = nil
        //Create FireStore Database
        let db = Firestore.firestore()
        let userID = NSUUID().uuidString
        let data: [String: Any] = ["userEmail":email,
                                   "password": password,
                                   "type": type,
                                   "userID": userID
                                   ]
        ref = db.document("users/\(userID)")
        ref?.setData(data, completion: { (error) in
            if error != nil {
                print("Error in add new member: \(String(describing: error))")
            } else {
                print("Created Successfully")
            }
        })
    }

    fileprivate func cleanTextFields() {
        newMemberEmailTextField.text! = ""
        newMemberType.text! = ""
        newMemberPasswordTextField.text! = ""
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        textField.resignFirstResponder()
        return true
    }
}
