//
//  Game.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import Foundation
///синглтон, в котором хранятся рекорды и текущая сессия
class Game {
    static let shared = Game()

    private init () {
        records = gameCaretaker.loadRecordes()
    }
    
    let gameCaretaker = GameCaretaker()
    
    var gameSession:GameSession?
    
    var records:[Record] = [] {
        didSet {
            gameCaretaker.saveRecords(recordes: records)
        }
    }
    
    var strategy:Strategy = StrategyCaretaker().loadStrategy()
}
