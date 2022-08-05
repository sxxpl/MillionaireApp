//
//  ViewController.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import UIKit

/// главный экран
class ViewController: UIViewController {
    
    var image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.frame.width/2
        image.image = UIImage(named: "123")
        return image
    }()
    
    var playButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Играть", for: .normal)
        button.setTitleColor( UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1) , for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var recordsButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Рекорды", for: .normal)
        button.setTitleColor( UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1) , for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(seeRecords), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var settingsButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Настройки", for: .normal)
        button.setTitleColor( UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1) , for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.01, green: 0.015, blue: 0.1, alpha: 1)
        setupConstraints()
        
        
    }
    
    private func setupConstraints(){
        view.addSubview(playButton)
        view.addSubview(recordsButton)
        view.addSubview(settingsButton)
        view.addSubview(image)
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: view.centerYAnchor,constant: 50),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 100),
            recordsButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 15),
            recordsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordsButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 100),
            settingsButton.topAnchor.constraint(equalTo: recordsButton.bottomAnchor, constant: 15),
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 100),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 15)
        ])
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 100
    }
    
    @objc func startGame(){
        let viewController = GameViewController()
        viewController.delegate = self
        switch Game.shared.strategy {
        case .normal:
            viewController.questionStrategy = NormalStrategy()
        case .random:
            viewController.questionStrategy = RandomStrategy()
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func seeRecords(){
        present(RecordsViewController(), animated: true)
    }
    
    @objc func openSettings(){
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
}

///подписание на протокол делегата gameViewController
extension ViewController:GameViewDelegateProtocol {
    
    func didGetCorrectAnswer() {
        Game.shared.gameSession?.score += 1
    }
    
    func didEndTheGame() {
        guard let gameSession = Game.shared.gameSession else {
            return
        }
        gameSession.date = Date()
        Game.shared.records.append(gameSession)
        Game.shared.gameSession = nil
    }
}

