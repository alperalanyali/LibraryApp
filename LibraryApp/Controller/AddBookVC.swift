//
//  AddBookVC.swift
//  LibraryApp
//
//  Created by Alper on 25.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

class AddBookVC: UIViewController {

    //MARK: Outlets f
    @IBOutlet weak var newBookNameTextField: LATextField!
    @IBOutlet weak var newBookAuthorTextField: LATextField!
    @IBOutlet weak var newBookTypeTextField: LATextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardGR)
        
    }
    
    //MARK: Action for Add New Book Button
    @IBAction func addNewBookPressed(_ sender: UIButton) {
        
        guard let newBook = newBookNameTextField.text else { return}
        
        guard let newBookAuthor = newBookAuthorTextField.text else { return}
        
        guard let newBookType = newBookTypeTextField.text else { return}
        
        books.append(Book(bookName: newBook, bookAuth: newBookAuthor, bookType: newBookType))
        print(books.count)
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: Close Button's Action
    @IBAction func closePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
}
