//
//  QuestionBuilder.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 05.08.2022.
//

import Foundation

class QuestionBuilder {
    private var questions:[Question] = []
    
    func addNewElements(count:Int){
        for i in questions.count..<questions.count+count {
            questions.append(Question(question: "", answers: ["","","",""], trueAnswer: ""))
        }
    }
    
    func addQuestion(question:String,index:Int){
        questions[index].question = question
    }
    
    func addFirstAnswer(firstAnswer:String,index:Int){
        questions[index].answers[0] = firstAnswer
    }
    
    func addSecondAnswer(secondAnswer:String,index:Int){
        questions[index].answers[1] = secondAnswer
    }
    
    func addThirdAnswer(thirdAnswer:String,index:Int){
        questions[index].answers[2] = thirdAnswer
    }
    
    func addFourthAnswer(fourthAnswer:String,index:Int){
        questions[index].answers[3] = fourthAnswer
    }
    
    func addTrueAnswer(trueAnswer:String,index:Int){
        questions[index].trueAnswer = trueAnswer
    }
    
    func build()->[Question] {
        return questions
    }
}
