//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Jonathan Gomes on 07/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numOfChars = 10
    var numOfPasswords = 1
    var useLowerCaseLetters: Bool!
    var userNumbers: Bool!
    var useUpperCaseLetters: Bool!
    var useSpecialChars: Bool!
    
    var passwordsGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Total de senhas? \(numOfPasswords)"
        passwordsGenerator = PasswordGenerator(numOfChars: numOfChars, numOfPasswords: numOfPasswords, useLowerCaseLetters: useLowerCaseLetters, userNumbers: userNumbers, useUpperCaseLetters: useUpperCaseLetters, useSpecialChars: useSpecialChars)
       generatePasswords()
    }
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordsGenerator.generate(total: numOfPasswords)
        for pass in passwords {
            tvPasswords.text.append(pass + "\n\n")
        }
    }
    @IBAction func generate(_ sender: Any) {
        generatePasswords()
    }
}
