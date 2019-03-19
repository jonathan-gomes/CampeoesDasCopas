//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Jonathan Gomes on 06/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    @IBOutlet weak var lbCountAnswersQuestions: UILabel!
    @IBOutlet weak var pvTimer: UIProgressView!
    
    var quizManager = QuizManager()
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.firstIndex(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    @IBAction func nextQuestion(_ sender: UIButton) {
        getNewQuiz()
    }
    @IBAction func finishQuiz(_ sender: UIButton) {
        showResults()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.pvTimer.progress = 0
//            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        quizManager = QuizManager()
        getNewQuiz()
    }
    func getNewQuiz() {
        quizManager.refreshQuiz()
        if(quizManager.hasQuestion){
            lbQuestion.text = quizManager.question
            lbCountAnswersQuestions.text = "\(quizManager.totalAnswers)/\(quizManager.totalQuestions)"
            for i in 0..<quizManager.options.count {
                let option = quizManager.options[i]
                let button = btAnswers[i]
                button.setTitle(option, for: .normal)
            }
        }else {
            showResults()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resulViewController = segue.destination as! ResultViewController
        resulViewController.totalAnswers = quizManager.totalAnswers
        resulViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
}
