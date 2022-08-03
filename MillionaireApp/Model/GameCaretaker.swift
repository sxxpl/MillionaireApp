//
//  GameCaretaker.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import Foundation

class GameCaretaker{
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let key = "records"
    
    let userDefaults = UserDefaults.standard
    
    func saveRecords(recordes:[GameSession]){
        do {
            let data = try encoder.encode(recordes)
            userDefaults.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func loadRecordes() -> [GameSession] {
        var records:[GameSession] = []
        do {
            guard let recordsJSON = userDefaults.data(forKey: key) else {
                return []
            }
            records = try decoder.decode([GameSession].self, from: recordsJSON)
        } catch {
            print(error)
        }
        return records
    }
}
