//
//  MemberTransactionVC.swift
//  LibraryApp
//
//  Created by Alper on 26.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

class MemberTransactionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func newMemberBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toAdNewMember", sender: nil)
    }
    
    @IBAction func cancelMemberPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toCancelMember", sender: nil)
    }
}
