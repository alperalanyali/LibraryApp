//
//  LAButton.swift
//  LibraryApp
//
//  Created by Alper on 23.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

class LAButton: UIButton {

    override func awakeFromNib() {
        
        self.layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.setTitleColor(.white, for: .normal)
    }

}
