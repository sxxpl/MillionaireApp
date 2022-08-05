//
//  RecordTableViewCell.swift
//  MillionaireApp
//
//  Created by Артем Тихонов on 03.08.2022.
//

import UIKit

///ячейка для таблицы с рекордами
class RecordTableViewCell: UITableViewCell {
    
    static var identifier = "RecordCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let dateFormatter:DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
    
    var scoreLabel:UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.9962093234, green: 0.7054080367, blue: 0, alpha: 1)
        label.font = .preferredFont(forTextStyle: .title3, compatibleWith: nil)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateLabel:UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.9962093234, green: 0.7054080367, blue: 0, alpha: 1)
        label.font = .preferredFont(forTextStyle: .body, compatibleWith: nil)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.backgroundColor = #colorLiteral(red: 0.1962192953, green: 0, blue: 0.2904796004, alpha: 1)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        contentView.addSubview(scoreLabel)
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            scoreLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15),
            scoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            scoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 15),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -15),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 15)
        ])
    }
    
    func configure(score:Int,date:Date){
        self.scoreLabel.text = String(score)
        self.dateLabel.text = dateFormatter.string(from: date)
    }
}
