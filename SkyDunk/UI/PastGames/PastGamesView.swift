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
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray3
        return view
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
        addSubviewsAndAutolayout([separatorView,
                                  pastGamesTableView])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 252),
            separatorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 13),
            separatorView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -13),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            pastGamesTableView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 17),
            pastGamesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            pastGamesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            pastGamesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
