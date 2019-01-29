//
//  AdminVC.swift
//  LibraryApp
//
//  Created by Alper on 24.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

class AdminVC: UIViewController {

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    
    @IBAction func bookTransactionPressed(_ sender: UIButton) {
    
        performSegue(withIdentifier: "toBookTransactions", sender: nil)
}
    
    @IBAction func memberTransactionPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMemberShip", sender: nil)
    }
    
}
