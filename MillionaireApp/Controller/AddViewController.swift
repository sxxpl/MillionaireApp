//
//  AddViewController.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 05.08.2022.
//

import UIKit

class AddViewController: UIViewController {
    
    var questions:[Question] = []
    
    private var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var saveButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor( UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1) , for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(saveQuestions), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var addButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("+", for: .normal)
        button.setTitleColor( UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1) , for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(addQuestion), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var cancelButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Вернуться", for: .normal)
        button.setTitleColor( UIColor(red: 1, green: 0, blue: 0, alpha: 1) , for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.backgroundColor = #colorLiteral(red: 0.01087955572, green: 0.01585353911, blue: 0.09932268411, alpha: 1)
        loadQuestions()
        setupViews()
        setupTableView()
        setupConstraints()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    private func setupViews(){
        view.addSubview(saveButton)
        view.addSubview(addButton)
        view.addSubview(cancelButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height*(3/4)),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            saveButton.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: (view.frame.width-90)/3),
            saveButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 30),
            addButton.leftAnchor.constraint(equalTo: saveButton.rightAnchor, constant: 15),
            addButton.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            addButton.widthAnchor.constraint(equalToConstant: (view.frame.width-90)/3),
            addButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 30),
            cancelButton.leftAnchor.constraint(equalTo: addButton.rightAnchor, constant: 15),
            cancelButton.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: (view.frame.width-90)/3),
            cancelButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 30)
        ])
    }
    
    private func setupTableView(){
        tableView.backgroundColor = #colorLiteral(red: 0.01087955572, green: 0.01585353911, blue: 0.09932268411, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 160
        tableView.register(AddTableViewCell.self, forCellReuseIdentifier: AddTableViewCell.identifier)
        tableView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(closeKeyboard)))
        view.addSubview(tableView)
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    private func loadQuestions(){
        questions = QuestionCaretaker().loadQuestions()
    }
    
    @objc private func saveQuestions(){
        let builder = QuestionBuilder()
        builder.addNewElements(count: questions.count)
        for i in 0..<questions.count {
            let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! AddTableViewCell
            guard cell.questionTextField.text != "",
                  cell.firstAnswerTextField.text != "",
                  cell.secondAnswerTextField.text != "",
                  cell.thirdAnswerTextField.text != "",
                  cell.fourthAnswerTextField.text != "",
                  cell.trueAnswerTextField.text != ""
            else {
                let alert = UIAlertController(title: "Ошибка", message: "Вы заполнили не все ячейки!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ок", style: .cancel))
                self.present(alert, animated: true)
                return
            }
            builder.addQuestion(question: cell.questionTextField.text!, index: i)
            builder.addFirstAnswer(firstAnswer: cell.firstAnswerTextField.text!, index: i)
            builder.addSecondAnswer(secondAnswer: cell.secondAnswerTextField.text!, index: i)
            builder.addThirdAnswer(thirdAnswer: cell.thirdAnswerTextField.text!, index: i)
            builder.addFourthAnswer(fourthAnswer: cell.fourthAnswerTextField.text!, index: i)
            builder.addTrueAnswer(trueAnswer: cell.trueAnswerTextField.text!, index: i)
        }
        let newQuestions = builder.build()
        questions = newQuestions
        QuestionCaretaker().saveQuestions(questions: newQuestions)
    }
    
    @objc private func addQuestion(){
        DispatchQueue.main.async {
            self.questions.append(Question(question: "", answers: ["","","",""], trueAnswer: ""))
            self.tableView.reloadData()
        }
    }
    
    @objc private func cancel(){
        navigationController?.popViewController(animated: true)
    }
    
}


extension AddViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier) as! AddTableViewCell
        cell.selectionStyle = .none
        cell.questionTextField.text = questions[indexPath.row].question
        cell.firstAnswerTextField.text = questions[indexPath.row].answers[0]
        cell.secondAnswerTextField.text = questions[indexPath.row].answers[1]
        cell.thirdAnswerTextField.text = questions[indexPath.row].answers[2]
        cell.fourthAnswerTextField.text = questions[indexPath.row].answers[3]
        cell.trueAnswerTextField.text = questions[indexPath.row].trueAnswer
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}
