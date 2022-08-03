//
//  GameViewDelegateProtocol.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import Foundation

protocol GameViewDelegateProtocol:AnyObject {
    func didGetCorrectAnswer()
    func didEndTheGame()
}
