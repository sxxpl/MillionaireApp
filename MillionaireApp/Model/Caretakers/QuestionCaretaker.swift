//
//  QuestionCaretaker.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 05.08.2022.
//

import Foundation

class QuestionCaretaker{
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let key = "question"
    
    let userDefaults = UserDefaults.standard
    
    func saveQuestions(questions:[Question]){
        do {
            let data = try encoder.encode(questions)
            userDefaults.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadQuestions() -> [Question] {
        var questions:[Question] = []
        do {
            guard let questionsJSON = userDefaults.data(forKey: key) else {
                return []
            }
            questions = try decoder.decode([Question].self, from: questionsJSON)
        } catch {
            print(error)
        }
        return questions
    }
}
