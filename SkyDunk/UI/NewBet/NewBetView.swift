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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var betTitleView: BetView = {
        let view = BetView(text: .betTitle)
//        let view = BetView()
//        view
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    lazy var betAmountView: BetView = {
//        let view = BetView(text: .betAmount)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    lazy var betCoefficientView: BetView = {
//        let view = BetView(text: .betCoefficient)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
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
//        addSubview(betAmountView)
//        addSubview(betCoefficientView)
//        betTitleView.backgroundColor = .systemOrange
        
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
            betTitleView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
