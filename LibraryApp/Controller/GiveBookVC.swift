//
//  GiveBookVC.swift
//  LibraryApp
//
//  Created by Alper on 25.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

class GiveBookVC: UIViewController {

    
    @IBOutlet weak var personNameTextField: LATextField!
    @IBOutlet weak var bookNameTextField: LATextField!
    @IBOutlet weak var dateTextField: LATextField!
    
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDatePicker()
    }
    

    @IBAction func giveBookPressed(_ sender: UIButton) {
        
        guard let personName = personNameTextField.text else { return}
        
        guard let bookName = bookNameTextField.text else { return}
        
        guard let date = dateTextField.text else { return}
        
        givenBook.append(bookName)
        givenPeople.append(personName)
        givenDate.append(date)
        
        print(givenBook,givenPeople,givenDate)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Helper Function
    
    func setupDatePicker(){
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        self.dateTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
    }
}
