//
//  NewBetView.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import UIKit

class NewBetView: UIView {
    
    private lazy var newBetLab: UILabel = {
        let label = UILabel(text: "Новая ставка", font: UIFont(type: .medium, size: 20), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gameHeaderView: GameHeaderView = {
        let view = GameHeaderView()
        return view
    }()
    
    lazy var betTitleTextField: CustomTextField = {
        let textField = CustomTextField(text: "Прогноз")
        return textField
    }()
    
    lazy var betAmountTextField: CustomTextField = {
        let textField = CustomTextField(text: "Ставка")
        return textField
    }()
    
    lazy var betCoefficientTextField: CustomTextField = {
        let textField = CustomTextField(text: "Коэффициент")
        return textField
    }()
        
    lazy var saveBetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(newBetLab)
        addSubview(gameHeaderView)
        addSubview(betTitleTextField)
        addSubview(betAmountTextField)
        addSubview(betCoefficientTextField)
        addSubview(saveBetButton)
        
        NSLayoutConstraint.activate([
            newBetLab.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            newBetLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            gameHeaderView.topAnchor.constraint(equalTo: newBetLab.bottomAnchor, constant: 19),
            gameHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            gameHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            gameHeaderView.heightAnchor.constraint(equalToConstant: 160),
            
            betTitleTextField.topAnchor.constraint(equalTo: gameHeaderView.bottomAnchor, constant: 41),
            betTitleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            betTitleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            betTitleTextField.heightAnchor.constraint(equalToConstant: 44),
            
            betAmountTextField.topAnchor.constraint(equalTo: betTitleTextField.bottomAnchor, constant: 27),
            betAmountTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            betAmountTextField.heightAnchor.constraint(equalToConstant: 44),
            betAmountTextField.widthAnchor.constraint(equalToConstant: 108),
            
            betCoefficientTextField.topAnchor.constraint(equalTo: betTitleTextField.bottomAnchor, constant: 27),
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
