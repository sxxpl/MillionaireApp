//
//  GameViewDelegateProtocol.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import Foundation

///протокол делегата
protocol GameViewDelegateProtocol:AnyObject {
    func didGetCorrectAnswer()
    func didEndTheGame()
}
