//
//  ViewController.swift
//  SuperSenha
//
//  Created by Jonathan Gomes on 07/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfChars: UITextField!
    @IBOutlet weak var swLowerCaseLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swUpperCaseLetters: UISwitch!
    @IBOutlet weak var swSpecialChars: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfTotalPasswords.delegate = self
        tfNumberOfChars.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numOfPasswords = numberOfPasswords
        }
        if let numberOfChars = Int(tfNumberOfChars.text!) {
            passwordsViewController.numOfChars = numberOfChars
        }
        passwordsViewController.useLowerCaseLetters = swLowerCaseLetters.isOn
        passwordsViewController.useUpperCaseLetters = swUpperCaseLetters.isOn
        passwordsViewController.userNumbers = swNumbers.isOn
        passwordsViewController.useSpecialChars = swSpecialChars.isOn
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfTotalPasswords {
            tfTotalPasswords.resignFirstResponder()
            tfNumberOfChars.becomeFirstResponder()
        } else if textField == tfNumberOfChars {
            tfNumberOfChars.resignFirstResponder()
            performSegue(withIdentifier: "segueToPasswordList", sender: nil)
        }
        return true
    }

}

