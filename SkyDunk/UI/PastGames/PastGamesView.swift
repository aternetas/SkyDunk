//
//  LastGamesView.swift
//  SkyDunk
//
//  Created by aternetas on 06.07.2024.
//

import UIKit

class PastGamesView: UIView {

    lazy var pastGamesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PastGameCell.self, forCellReuseIdentifier: PastGameCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func initConstraints() {
        addSubviewsAndAutolayout([pastGamesTableView])
        
        NSLayoutConstraint.activate([
            pastGamesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 277),
            pastGamesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            pastGamesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            pastGamesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
