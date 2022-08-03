//
//  GameViewController.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import UIKit

///контроллер с игрой
class GameViewController: UIViewController {
    
    weak var delegate:GameViewDelegateProtocol?
    
    ///вопросы для игры
    var questions = [
    Question(question: "Как звали пушкинского Онегина?", answers: ["Александр", "Иван","Евгений", "Михаил"], trueAnswer: "Евгений"),
    Question(question: "Какой вид транспорта, еще не имеет службы предварительного заказа билетов?", answers: ["Морской", "Авиационный", "Железнодорожный","Троллейбусный"], trueAnswer: "Троллейбусный"),
    Question(question: "Чему равен периметр ромба со стороной 2 м?", answers: ["4 метра","8 метров", "6 литров", "8 метров квадратных"], trueAnswer: "8 метров"),
    Question(question: "Как называются дополнения к основному сюжету игры?", answers: ["Сториап", "Апгрейд", "Скилл","Аддон"], trueAnswer: "Аддон"),
    Question(question: "Кого рыбак всегда видит издалека?", answers: ["Червяка", "Рыбовода","Рыбака", "Рыбнадзор"], trueAnswer: "Рыбака"),
    ]
    
    
    var firstButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitleColor( .white , for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(getAnswer(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var secondButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitleColor( .white , for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(getAnswer(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var thirdButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitleColor( .white , for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(getAnswer(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var fourthButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitleColor( .white , for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(getAnswer(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var questionLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.borderWidth = 3
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4
        label.textColor = .white
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title3, compatibleWith: nil)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.01, green: 0.015, blue: 0.1, alpha: 1)
        setupViews()
        setupConstraints()
        Game.shared.gameSession = GameSession()
        Game.shared.gameSession?.score = 0
        setupQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    private func setupViews(){
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(fourthButton)
        view.addSubview(questionLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            firstButton.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            firstButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            firstButton.trailingAnchor.constraint(equalTo: view.readableContentGuide.centerXAnchor, constant: -10),
            firstButton.heightAnchor.constraint(equalToConstant: 90),
            secondButton.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            secondButton.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            secondButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.centerXAnchor, constant: 10),
            secondButton.heightAnchor.constraint(equalToConstant: 90),
            thirdButton.bottomAnchor.constraint(equalTo: firstButton.readableContentGuide.topAnchor,constant: -20),
            thirdButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            thirdButton.trailingAnchor.constraint(equalTo: view.readableContentGuide.centerXAnchor, constant: -10),
            thirdButton.heightAnchor.constraint(equalToConstant: 90),
            fourthButton.bottomAnchor.constraint(equalTo: secondButton.readableContentGuide.topAnchor,constant: -20),
            fourthButton.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            fourthButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.centerXAnchor, constant: 10),
            fourthButton.heightAnchor.constraint(equalToConstant: 90),
            questionLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor,constant: -100),
            questionLabel.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor,constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor,constant: -10),
            questionLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupQuestions(){
        guard let questionIndex = Game.shared.gameSession?.score else {
            navigationController?.popToRootViewController(animated: true)
            return
        }
        firstButton.setTitle(questions[questionIndex].answers[0], for: .normal)
        secondButton.setTitle(questions[questionIndex].answers[1], for: .normal)
        thirdButton.setTitle(questions[questionIndex].answers[2], for: .normal)
        fourthButton.setTitle(questions[questionIndex].answers[3], for: .normal)
        questionLabel.text = questions[questionIndex].question
    }
    
    ///метод применяется при нажатии на кнопку
    @objc func getAnswer(sender: UIButton!){
        guard let questionIndex = Game.shared.gameSession?.score else {
            navigationController?.popToRootViewController(animated: true)
            return
        }
        if sender.titleLabel?.text == questions[questionIndex].trueAnswer {
            delegate?.didGetCorrectAnswer()
            if Game.shared.gameSession?.score == questions.count {
                delegate?.didEndTheGame()
                navigationController?.popToRootViewController(animated: true)
            }
            setupQuestions()
        } else {
            delegate?.didEndTheGame()
            navigationController?.popToRootViewController(animated: true)
        }
    }
}


