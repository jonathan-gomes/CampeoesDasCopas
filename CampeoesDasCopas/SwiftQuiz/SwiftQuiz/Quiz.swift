//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Jonathan Gomes on 06/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import Foundation

class Quiz {
    let question: String
    let options: [String]
    private let correctAnswer: String
    
    init(question: String, options: [String], correctAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
    
    deinit {
        print("liberou quiz da memoria")
    }
    
    func validateOption(_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctAnswer
    }
    
}
