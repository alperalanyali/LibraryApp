//
//  LATextField.swift
//  LibraryApp
//
//  Created by Alper on 23.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

class LATextField: UITextField {

    override func awakeFromNib() {
        
        self.layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2
    }
}
