//
//  GameCaretaker.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import Foundation

///caretaker для паттерна memento (позволяет сохранять рекорды)
class GameCaretaker{
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let key = "records"
    
    let userDefaults = UserDefaults.standard
    
    func saveRecords(recordes:[Record]){
        do {
            let data = try encoder.encode(recordes)
            userDefaults.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadRecordes() -> [Record] {
        var records:[Record] = []
        do {
            guard let recordsJSON = userDefaults.data(forKey: key) else {
                return []
            }
            records = try decoder.decode([Record].self, from: recordsJSON)
        } catch {
            print(error)
        }
        return records
    }
}
