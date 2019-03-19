//
//  BaseViewController.swift
//  Mensagens
//
//  Created by Jonathan Gomes on 08/02/2019.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, ColorPickerProtocol{

    @IBOutlet weak var lbMessage: UILabel!
    var message: Message!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func applyColor(color: UIColor) {
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        let colorPicker = storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
        colorPicker.modalPresentationStyle = .overCurrentContext
        colorPicker.reference = self
        present(colorPicker, animated: false, completion: nil)
    }
}
