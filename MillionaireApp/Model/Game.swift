//
//  Game.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import Foundation

class Game {
    static let shared = Game()

    private init () {
        records = gameCaretaker.loadRecordes()
    }
    
    let gameCaretaker = GameCaretaker()
    
    var gameSession:GameSession?
    
    var records:[GameSession] = [] {
        didSet {
            gameCaretaker.saveRecords(recordes: records)
        }
    }
}
