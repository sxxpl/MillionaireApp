//
//  StrategyCaretaker.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 05.08.2022.
//

import Foundation

///caretaker для паттерна memento (позволяет сохранять рекорды)
class StrategyCaretaker{
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let key = "strategy"
    
    let userDefaults = UserDefaults.standard
    
    func saveStrategy(strategy:Strategy){
        do {
            let data = try encoder.encode(strategy)
            userDefaults.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadStrategy() -> Strategy {
        var strategy:Strategy = .normal
        do {
            guard let strategyJSON = userDefaults.data(forKey: key) else {
                return .normal
            }
            strategy = try decoder.decode(Strategy.self, from: strategyJSON)
        } catch {
            print(error)
        }
        return strategy
    }
}
