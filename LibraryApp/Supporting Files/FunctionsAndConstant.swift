//
//  HelperFunctions.swift
//  LibraryApp
//
//  Created by Alper on 23.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

func showAlert(on vc: UIViewController,title:String,message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okBtn)
    vc.present(alert, animated: true, completion: nil)
    
}



enum selectedScope: Int {
    case name = 0
    case author = 1
    case type = 2
}
