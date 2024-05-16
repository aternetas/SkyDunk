//
//  GameView.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import UIKit

class GameView: UIView {
    
    lazy var gameHeaderView = {
        let view = GameHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var betsTableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(BetCell.self, forCellReuseIdentifier: BetCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundWhite
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints() {
        addSubview(gameHeaderView)
        addSubview(betsTableView)
        
        NSLayoutConstraint.activate([
            gameHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            gameHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            gameHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            gameHeaderView.heightAnchor.constraint(equalToConstant: 160),
            
            betsTableView.topAnchor.constraint(equalTo: gameHeaderView.bottomAnchor, constant: 10),
            betsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            betsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            betsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
