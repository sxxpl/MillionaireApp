//
//  QuestionOrderStrategyProtocol.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 05.08.2022.
//

import Foundation

protocol QuestionOrderStrategyProtocol {
    func setQuestions(questions:inout[Question])
}

enum Strategy:Codable {
    case normal
    case random
}

class NormalStrategy: QuestionOrderStrategyProtocol {
    func setQuestions(questions: inout[Question]) {
        
    }
}

class RandomStrategy: QuestionOrderStrategyProtocol {
    func setQuestions(questions: inout[Question]) {
        questions.shuffle()
    }
}

