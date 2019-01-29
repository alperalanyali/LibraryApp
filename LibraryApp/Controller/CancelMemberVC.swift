//
//  CancelMemberVC.swift
//  LibraryApp
//
//  Created by Alper on 26.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CancelMemberVC: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var memberEmailTextField: LATextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegation of memberEmailTextField
        memberEmailTextField.delegate = self
        
    }
    
    
    //MARK: Actions for Buttons
    @IBAction func cancelMemberPressed(_ sender: UIButton) {
        
        guard let email = memberEmailTextField.text else {return }
        deleteDataFromStore(email: email)
        //Clean the textField
        cleanTextField()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        
        cleanTextField()
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Helper Functions
    
    func deleteDataFromStore(email: String){
        
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("users")
        print(docRef)
        docRef.getDocuments { (querry, error) in
            
            if error != nil {
                print("Error: \(error.debugDescription)")
            } else {
                for document in querry!.documents {
                    
                    let userDic = document.data()
                    
                    if email == userDic["userEmail"] as! String  {
                        
                        guard let userID = userDic["userID"]  else { return}
                        
                        docRef.document("\(userID)").delete(completion: { (error) in
                           
                            if error != nil {
                                
                                print("Error removing document: \(String(describing: error))")
                                
                            } else {
                                
                                print("Document removed successfully")
                                
                            }
                        })
                    }
                    
                }
            }
        }
    }
    
    
    func cleanTextField(){
        
        memberEmailTextField.text! = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

