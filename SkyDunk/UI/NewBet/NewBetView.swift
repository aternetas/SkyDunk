//
//  NewBetView.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import UIKit

class NewBetView: UIView {
    
    private lazy var newBetLab: UILabel = {
        let label = UILabel(text: "Новая ставка", font: .medium20)
        return label
    }()
    
    lazy var gameHeaderView: GameHeaderView = {
        let view = GameHeaderView()
        return view
    }()
    
    lazy var betDescriptionTextField: CustomTextField = {
        let textField = CustomTextField(text: "Прогноз")
        textField.keyboardType = .default
        return textField
    }()
    
    lazy var betAmountTextField: CustomTextField = {
        let textField = CustomTextField(text: "Ставка")
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    lazy var betCoefficientTextField: CustomTextField = {
        let textField = CustomTextField(text: "Коэффициент")
        textField.keyboardType = .decimalPad
        return textField
    }()
        
    lazy var saveBetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.textLight, for: .normal)
        button.titleLabel?.font = UIFont(type: .regular, size: 16)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var vm: NewBetViewModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        backgroundColor = .backgroundWhite
        initConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstaints() {
        addSubviewsAndAutolayout([newBetLab,
                                  gameHeaderView,
                                  betDescriptionTextField,
                                  betAmountTextField,
                                  betCoefficientTextField,
                                  saveBetButton])
        
        NSLayoutConstraint.activate([
            newBetLab.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            newBetLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            gameHeaderView.topAnchor.constraint(equalTo: newBetLab.bottomAnchor, constant: 19),
            gameHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            gameHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            gameHeaderView.heightAnchor.constraint(equalToConstant: 160),
            
            betDescriptionTextField.topAnchor.constraint(equalTo: gameHeaderView.bottomAnchor, constant: 41),
            betDescriptionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            betDescriptionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            betDescriptionTextField.heightAnchor.constraint(equalToConstant: 44),
            
            betAmountTextField.topAnchor.constraint(equalTo: betDescriptionTextField.bottomAnchor, constant: 27),
            betAmountTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            betAmountTextField.heightAnchor.constraint(equalToConstant: 44),
            betAmountTextField.widthAnchor.constraint(equalToConstant: 108),
            
            betCoefficientTextField.topAnchor.constraint(equalTo: betDescriptionTextField.bottomAnchor, constant: 27),
            betCoefficientTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            betCoefficientTextField.heightAnchor.constraint(equalToConstant: 44),
            betCoefficientTextField.widthAnchor.constraint(equalToConstant: 108),
            
            saveBetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            saveBetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            saveBetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            saveBetButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
