//
//  MemberVC.swift
//  LibraryApp
//
//  Created by Alper on 24.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import UIKit

//MARK: Global variable because we need to access another View Controllers
var books: [Book] = Book.generateBooks()

class MemberVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegation and DataSource of TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBarSetup()
       
        definesPresentationContext = true
        
        let keyboardHideGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(keyboardHideGR)
    }
    
    
    //MARK: Helper Functions
    //MARK: SearchBar Setup Function
    
    func searchBarSetup(){
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width), height: 70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name","Author","Type"]
        searchBar.delegate = self
        searchBar.selectedScopeButtonIndex = 0
        searchBar.tintColor = .darkGray
        self.tableView.tableHeaderView = searchBar
    }
    
    func filterTableView(ind: Int,text: String){
        
        switch ind {
        case selectedScope.name.rawValue:
            
            books = books.filter{ (book) -> Bool in
                return book.bookName.lowercased().contains(text.lowercased())
            }
            self.tableView.reloadData()
            
        case selectedScope.author.rawValue:
            
            books = books.filter{ (book) -> Bool in
                return book.bookAuth.lowercased().contains(text.lowercased())
            }
            self.tableView.reloadData()
            
        case selectedScope.type.rawValue:
            
            books = books.filter{ (book) -> Bool in
                return book.bookType.lowercased().contains(text.lowercased())
                
            }
            self.tableView.reloadData()
            
        default:
            break
        }
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    //MARK: Functions for TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BookCell
     
        cell.bookNameLabel.text = books[indexPath.row].bookName
        cell.authorLabel.text = books[indexPath.row].bookAuth
        cell.bookTypeLabel.text = books[indexPath.row].bookType
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    //MARK: Functions for SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            
            books = Book.generateBooks()
            
            self.tableView.reloadData()
        } else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex,text: searchText )
        }
    }

    
    
 
}
