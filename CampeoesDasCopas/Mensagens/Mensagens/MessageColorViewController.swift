//
//  MessageColorViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageColorViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbMessage.text = message.text!
        lbMessage.textColor = message.textColor
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ScreenColorViewController
        viewController.message = message
    }
    override func applyColor(color: UIColor) {
        super.applyColor(color: color)
        lbMessage.backgroundColor = color
        message.backgroundColor = color
    }
}

