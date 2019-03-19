//
//  ViewController.swift
//  Conversores
//
//  Created by Jonathan Gomes on 29/01/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text!{
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for:.normal)
                btUnit2.setTitle("Libra", for:.normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for:.normal)
                btUnit2.setTitle("Dólar", for:.normal)
            case "Moeda":
                lbUnit.text = "Distancia"
                btUnit1.setTitle("Metro", for:.normal)
                btUnit2.setTitle("Kilômetro", for:.normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for:.normal)
                btUnit2.setTitle("Fahrenheit", for:.normal)
        }
        convert(nil)
    }
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender{
            if(sender == btUnit1){
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
            switch lbUnit.text!{
                case "Temperatura":
                    calcTemperature()
                case "Peso":
                    calcWeight()
                case "Moeda":
                    calcCurrency()
                default:
                    calcDistance()
            }
        }
    }
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "°F"
            lbResult.text = String((temperature * 1.8 + 32.0).rounded(toPlaces: 2))
        }else{
            lbResultUnit.text = "°C"
            lbResult.text = String(((temperature - 32.0)/1.8).rounded(toPlaces: 2))
        }
    }
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "lb"
            lbResult.text = String((weight / 2.2046).rounded(toPlaces: 2))
        }else{
            lbResultUnit.text = "Kg"
            lbResult.text = String((weight * 2.2046).rounded(toPlaces: 2))
        }
    }
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "US$"
            lbResult.text = String((currency / 3.7).rounded(toPlaces: 2))
        }else{
            lbResultUnit.text = "R$"
            lbResult.text = String((currency * 3.7).rounded(toPlaces: 2))
        }
        
    }
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Km"
            lbResult.text = String((distance / 1000).rounded(toPlaces: 2))
        }else{
            lbResultUnit.text = "m"
            lbResult.text = String((distance * 1000).rounded(toPlaces: 2))
        }
    }
    
}

