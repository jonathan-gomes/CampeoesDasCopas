//
//  ViewController.swift
//  Loteria
//
//  Created by Jonathan Gomes on 04/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import UIKit

enum GameType: String{
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
    
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if(!result.contains(randomNumber)){
            result.append(randomNumber)
        }
    }
    
    return result.sorted()
}

class ViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var numberBalls: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }

    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
    }
    
    func showNumbers(for type: GameType){
        lbGameType.text = type.rawValue
        var game: [Int] = []
        switch type {
            case .megasena:
                game = 6>-<60
                numberBalls.last!.isHidden = false
            case .quina:
                game = 5>-<80
                numberBalls.last!.isHidden = true
        }
        for (index, game) in game.enumerated(){
            numberBalls[index].setTitle("\(game)", for: .normal)
        }
    }
}

