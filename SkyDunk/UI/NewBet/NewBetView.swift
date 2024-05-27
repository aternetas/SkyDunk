//
//  NewBetView.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import UIKit

class NewBetView: UIView {
    
    lazy var newBetLab: UILabel = {
        let label = UILabel(text: "Новая ставка", font: UIFont(type: .medium, size: 20), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gameHeaderView: GameHeaderView = {
        let view = GameHeaderView()
        return view
    }()
    
    lazy var betTitleView: BetView = {
        let view = BetView(text: .betTitle)
        return view
    }()
    
    lazy var betAmountView: BetView = {
        let view = BetView(text: .betAmount)
        return view
    }()
    
    lazy var betCoefficientView: BetView = {
        let view = BetView(text: .betCoefficient)
        return view
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
        addSubview(betTitleView)
        addSubview(betAmountView)
        addSubview(betCoefficientView)
        addSubview(saveBetButton)
        
        NSLayoutConstraint.activate([
            newBetLab.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            newBetLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            gameHeaderView.topAnchor.constraint(equalTo: newBetLab.bottomAnchor, constant: 19),
            gameHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            gameHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            gameHeaderView.heightAnchor.constraint(equalToConstant: 160),
            
            betTitleView.topAnchor.constraint(equalTo: gameHeaderView.bottomAnchor, constant: 41),
            betTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            betTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            betTitleView.heightAnchor.constraint(equalToConstant: 44),
            
            betAmountView.topAnchor.constraint(equalTo: betTitleView.bottomAnchor, constant: 27),
            betAmountView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            betAmountView.heightAnchor.constraint(equalToConstant: 44),
            betAmountView.widthAnchor.constraint(equalToConstant: 108),
            
            betCoefficientView.topAnchor.constraint(equalTo: betTitleView.bottomAnchor, constant: 27),
            betCoefficientView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            betCoefficientView.heightAnchor.constraint(equalToConstant: 44),
            betCoefficientView.widthAnchor.constraint(equalToConstant: 108),
            
            saveBetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            saveBetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            saveBetButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -101),
            saveBetButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
