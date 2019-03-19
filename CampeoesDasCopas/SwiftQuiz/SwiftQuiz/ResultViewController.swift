//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Jonathan Gomes on 06/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers = 0
    var totalAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbAnswered.text = "Perguntas respondidas \(totalAnswers)"
        lbCorrect.text = "Respostas corretas \(totalCorrectAnswers)"
        lbWrong.text = "Respostas erradas \(totalAnswers - totalCorrectAnswers)"
        let score = totalAnswers > 0 ? totalCorrectAnswers * 100 / totalAnswers : 0
        lbScore.text = "\(score) %"
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
