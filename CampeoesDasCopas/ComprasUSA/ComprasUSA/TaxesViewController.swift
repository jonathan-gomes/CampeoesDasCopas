//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Jonathan Gomes on 08/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    @IBAction func changeIOF(_ sender: UISwitch) {
        if sender.isOn {
            lbIOFDescription.isHidden = false
            lbIOF.isHidden = false
        } else {
            lbIOFDescription.isHidden = true
            lbIOF.isHidden = true
        }
        calculateTaxes()
    }
    func calculateTaxes() {
        lbStateTaxDescription.text = "Imposto do Estato (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        lbDolar.text = "\(tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ "))"
        lbStateTaxes.text = "\(tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "US$ "))"
        lbIOF.text = "\(tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ "))"
        
        let total = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbTotal.text = tc.getFormattedValue(of: total, withCurrency: "R$ ")
    }
}
