//
//  ReceiveBookVC.swift
//  LibraryApp
//
//  Created by Alper on 25.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

class ReceiveBookVC: UIViewController {

    
    @IBOutlet weak var personTextField: LATextField!
    @IBOutlet weak var bookNameTextField: LATextField!
    @IBOutlet weak var dateTextField: LATextField!
    
    //MARK: Variable
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDatePicker()
    }
    
    @IBAction func receiveBookPressed(_ sender: UIButton) {
        
        guard let personName = personTextField.text else { return}
        
        guard let bookName = bookNameTextField.text else { return}
        
        guard let date = dateTextField.text else { return}
        
        receiveBook.append(bookName)
        receivePeople.append(personName)
        receiveDate.append(date)
        print(receiveBook,receivePeople,receiveDate)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupDatePicker(){
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
        
        view.endEditing(true)
    }
}
