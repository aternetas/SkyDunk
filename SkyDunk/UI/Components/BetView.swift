//
//  BetTextField.swift
//  SkyDunk
//
//  Created by aternetas on 25.05.2024.
//

import UIKit

class BetView: UIView {
    
    enum TitleLabType: String {
        case betTitle = "Прогноз"
        case betAmount = "Ставка"
        case betCoefficient = "Коэффициент"
    }
    
    private lazy var titleLab: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(type: .regular, size: 12)
        label.textColor = .textGray
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(type: .regular, size: 14)
        textField.textColor = .textDark
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "test"
        return textField
    }()
    
    init(text: TitleLabType) {
        super.init(frame: .zero)
        titleLab.text = text.rawValue
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initConstraints() {
        addSubview(titleLab)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            titleLab.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLab.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLab.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            titleLab.heightAnchor.constraint(equalToConstant: 14),
            
            textField.topAnchor.constraint(equalTo: titleLab.bottomAnchor, constant: 6),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textField.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}
