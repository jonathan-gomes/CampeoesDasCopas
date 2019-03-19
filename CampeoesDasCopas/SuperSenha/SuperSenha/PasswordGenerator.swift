//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Jonathan Gomes on 07/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import Foundation

class PasswordGenerator {
    let minCharNumber = 1
    let maxCharNumber = 16
    
    var numOfChars: Int
    var numOfPasswords: Int
    var useLowerCaseLetters: Bool
    var userNumbers: Bool
    var useUpperCaseLetters: Bool
    var useSpecialChars: Bool
    
    var passwords: [String] = []
   
    let letters = (97...122).map({String(UnicodeScalar($0))}).joined()
    let numbers = "0123456789"
    let specialChars = "!@#$%ˆ&*()_+=˜`|]}[{':;?/<>.,"
    
    init(numOfChars: Int, numOfPasswords: Int, useLowerCaseLetters: Bool, userNumbers: Bool, useUpperCaseLetters: Bool, useSpecialChars: Bool) {
     
        let numChars = min(max(numOfChars, minCharNumber), maxCharNumber)
        self.numOfChars = numChars
        self.numOfPasswords = numOfPasswords
        self.useLowerCaseLetters = useLowerCaseLetters
        self.userNumbers = userNumbers
        self.useUpperCaseLetters = useUpperCaseLetters
        self.useSpecialChars = useSpecialChars
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        if(useLowerCaseLetters) {
            universe += letters
        }
        if(userNumbers) {
            universe += numbers
        }
        if(useUpperCaseLetters) {
            universe += letters.uppercased()
        }
        if(useSpecialChars) {
            universe += specialChars
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numOfChars {
                let index = Int(arc4random_uniform(UInt32(universe.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
