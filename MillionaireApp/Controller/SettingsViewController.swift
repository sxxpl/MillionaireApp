//
//  SettingsViewController.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 05.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var questionStrategyButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(changeQuestionStrategy), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var questionStrategyLabel:UILabel = {
        let label = UILabel()
        label.text = "Очередность вопросов:"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .body, compatibleWith: nil)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var addButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Добавить новые вопросы", for: .normal)
        button.setTitleColor( UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1) , for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(addQuestions), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.01, green: 0.015, blue: 0.1, alpha: 1)
        setupStrategyButton()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupConstraints(){
        view.addSubview(questionStrategyButton)
        view.addSubview(questionStrategyLabel)
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            questionStrategyButton.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            questionStrategyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionStrategyButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 100),
            questionStrategyLabel.bottomAnchor.constraint(equalTo: questionStrategyButton.topAnchor, constant: -15),
            questionStrategyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionStrategyLabel.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 50),
            addButton.topAnchor.constraint(equalTo: questionStrategyButton.bottomAnchor,constant: 50),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor,constant: 30),
        ])
    }
    
    private func setupStrategyButton(){
        let strategy = Game.shared.strategy
        changeStrategyButtonColor(strategy: strategy)
    }
    
    func changeStrategyButtonColor(strategy:Strategy){
        switch strategy {
        case .normal:
            UIView.animate(withDuration: 0.2) {
                self.questionStrategyButton.setTitle("По очереди", for: .normal)
                self.questionStrategyButton.setTitleColor( UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1) , for: .normal)
                self.questionStrategyButton.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 0.3)
            }

        case .random:
            UIView.animate(withDuration: 0.2) {
                self.questionStrategyButton.setTitle("Случайно", for: .normal)
                self.questionStrategyButton.setTitleColor( UIColor(red: 1, green: 0.7, blue: 0.01, alpha: 1) , for: .normal)
                self.questionStrategyButton.backgroundColor = UIColor(red: 1, green: 0.7, blue: 0.01, alpha: 0.3)
            }
        }
    }
    
    @objc func changeQuestionStrategy(){
        if Game.shared.strategy == .normal {
            Game.shared.strategy = .random
            changeStrategyButtonColor(strategy: .random)
            StrategyCaretaker().saveStrategy(strategy: .random)
        } else {
            Game.shared.strategy = .normal
            changeStrategyButtonColor(strategy: .normal)
            StrategyCaretaker().saveStrategy(strategy: .normal)
        }
    }
    
    @objc func addQuestions(){
        navigationController?.pushViewController(AddViewController(), animated: true)
    }
}
