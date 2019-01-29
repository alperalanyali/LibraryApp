//
//  BooksData.swift
//  LibraryApp
//
//  Created by Alper on 23.01.2019.
//  Copyright © 2019 Alper. All rights reserved.
//

import Foundation
import UIKit

class Book:NSObject {
    
    let bookName: String!
    let bookAuth: String!
    let bookType: String!
    
    
    init(bookName: String,bookAuth: String, bookType:String){
        
        self.bookName = bookName
        self.bookAuth = bookAuth
        self.bookType = bookType
    }
    
    class func generateBooks() -> [Book]{
        
        var bookArr = [Book]()
        bookArr.append(Book(bookName: "Koloni", bookAuth: "Jean-Chirstophe Grange", bookType: "Polisiye"))
        bookArr.append(Book(bookName: "Hayvan Ciftigi", bookAuth: "George ORWELL", bookType: "Fabl"))
        bookArr.append(Book(bookName: "1984", bookAuth: "George ORWELL", bookType: "Distopik"))
        bookArr.append(Book(bookName: "Turgut Reis", bookAuth: "Halikarnas Balıkcısı", bookType: "Biyorgrafik Roman"))
        
        return bookArr
    }
}


var givenBook = [String]()
var givenPeople = [String]()
var givenDate = [String]()


var receiveBook = [String]()
var receivePeople = [String]()
var receiveDate = [String]()


