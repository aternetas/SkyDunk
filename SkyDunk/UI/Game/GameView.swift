//
//  GameView.swift
//  SkyDunk
//
//  Created by aternetas on 12.05.2024.
//

import UIKit

class GameView: UIView {
    
    lazy var gameHeaderView = GameHeaderView()
    
    lazy var betsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(BetCell.self, forCellReuseIdentifier: BetCell.identifier)
        return tableView
    }()
    
    lazy var newBetButton: UIButton = {
        let button = UIButton(type: .system)
        button.isHidden = true
        button.backgroundColor = UIColor(resource: .buttonBackgroundPrimary)
        button.setImage(.plusIcon, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30.5
        button.addShadows()
        return button
    }()
    
    lazy var emptyStateView: InfoView = InfoView(text: "В этом матче пока нет ставок")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundWhite
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints() {
        addSubviewsAndAutolayout([gameHeaderView,
                                  emptyStateView,
                                  betsTableView,
                                  newBetButton])
        
        NSLayoutConstraint.activate([
            gameHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 19),
            gameHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            gameHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            gameHeaderView.heightAnchor.constraint(equalToConstant: 160),
            
            betsTableView.topAnchor.constraint(equalTo: gameHeaderView.bottomAnchor, constant: 10),
            betsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            betsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            betsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            newBetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            newBetButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            newBetButton.heightAnchor.constraint(equalToConstant: 61),
            newBetButton.widthAnchor.constraint(equalToConstant: 61),
            
            emptyStateView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            emptyStateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptyStateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emptyStateView.heightAnchor.constraint(equalToConstant: 157)
        ])
    }
}
