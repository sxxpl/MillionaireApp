//
//  AddTableViewCell.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 05.08.2022.
//

import UIKit

class AddTableViewCell: UITableViewCell {

    static var identifier = "AddCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    var questionTextField:UITextField = {
        var textField = UITextField()
        textField.placeholder = "Вопрос"
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.font = .preferredFont(forTextStyle: .title2, compatibleWith: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var firstAnswerTextField:UITextField = {
        var textField = UITextField()
        textField.placeholder = "Ответ"
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.font = .preferredFont(forTextStyle: .title2, compatibleWith: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var secondAnswerTextField:UITextField = {
        var textField = UITextField()
        textField.placeholder = "Ответ"
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.font = .preferredFont(forTextStyle: .title2, compatibleWith: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var thirdAnswerTextField:UITextField = {
        var textField = UITextField()
        textField.placeholder = "Ответ"
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.font = .preferredFont(forTextStyle: .title2, compatibleWith: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var fourthAnswerTextField:UITextField = {
        var textField = UITextField()
        textField.placeholder = "Ответ"
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.font = .preferredFont(forTextStyle: .title2, compatibleWith: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var trueAnswerTextField:UITextField = {
        var textField = UITextField()
        textField.placeholder = "Правильный ответ"
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        textField.font = .preferredFont(forTextStyle: .title2, compatibleWith: nil)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.addSubview(questionTextField)
        contentView.addSubview(firstAnswerTextField)
        contentView.addSubview(secondAnswerTextField)
        contentView.addSubview(thirdAnswerTextField)
        contentView.addSubview(fourthAnswerTextField)
        contentView.addSubview(trueAnswerTextField)
    }
    
    
    private func setupConstraints(){
        let height = 30
        NSLayoutConstraint.activate([
            questionTextField.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            questionTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            questionTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            questionTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            firstAnswerTextField.topAnchor.constraint(equalTo: questionTextField.bottomAnchor,constant: 10),
            firstAnswerTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            firstAnswerTextField.widthAnchor.constraint(equalToConstant: (contentView.frame.width-20)/2),
            firstAnswerTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            secondAnswerTextField.topAnchor.constraint(equalTo: questionTextField.bottomAnchor,constant: 10),
            secondAnswerTextField.leadingAnchor.constraint(equalTo: firstAnswerTextField.trailingAnchor,constant: 10),
            secondAnswerTextField.widthAnchor.constraint(equalToConstant: (contentView.frame.width-20)/2),
            secondAnswerTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            thirdAnswerTextField.topAnchor.constraint(equalTo: firstAnswerTextField.bottomAnchor,constant: 10),
            thirdAnswerTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            thirdAnswerTextField.widthAnchor.constraint(equalToConstant: (contentView.frame.width-20)/2),
            thirdAnswerTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            fourthAnswerTextField.topAnchor.constraint(equalTo: firstAnswerTextField.bottomAnchor,constant: 10),
            fourthAnswerTextField.leadingAnchor.constraint(equalTo: thirdAnswerTextField.trailingAnchor,constant: 10),
            fourthAnswerTextField.widthAnchor.constraint(equalToConstant: (contentView.frame.width-20)/2),
            fourthAnswerTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            trueAnswerTextField.topAnchor.constraint(equalTo: thirdAnswerTextField.bottomAnchor,constant: 10),
            trueAnswerTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            trueAnswerTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            trueAnswerTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)),
        ])
    }


}



