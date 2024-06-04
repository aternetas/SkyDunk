//
//  HomeView.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class HomeView: UIView {
    
    lazy var lastGameView = LastGameView()
    
    lazy private var nextGameLabel = {
        let label = UILabel(text: "БЛИЖАЙШИЕ ИГРЫ",
                            font: UIFont(type: .light, size: 18),
                            textColor: .textDark)
        return label
    }()
    
    lazy var nextGamesCollectionView = {
        let cvFlowLayout = UICollectionViewFlowLayout()
        cvFlowLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvFlowLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.register(GameCell.self, forCellWithReuseIdentifier: GameCell.identifier)
        return cv
    }()
    
    lazy private var activeBetsLabel = {
        let label = UILabel(text: "АКТИВНЫЕ СТАВКИ",
                            font: UIFont(type: .light, size: 18),
                            textColor: .textDark)
        return label
    }()
    
    lazy var betsTableView: UITableView = {
        let tableView = UITableView()
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
        addSubviewsAndAutolayout([lastGameView,
                                  nextGameLabel,
                                  nextGamesCollectionView,
                                  activeBetsLabel,
                                  betsTableView])
        
        NSLayoutConstraint.activate([
            lastGameView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            lastGameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lastGameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lastGameView.heightAnchor.constraint(equalToConstant: 157),
            
            nextGameLabel.topAnchor.constraint(equalTo: lastGameView.bottomAnchor, constant: 40),
            nextGameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            nextGamesCollectionView.topAnchor.constraint(equalTo: nextGameLabel.bottomAnchor, constant: 20),
            nextGamesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            nextGamesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            nextGamesCollectionView.heightAnchor.constraint(equalToConstant: GameCell.HEIGHT),
            
            activeBetsLabel.topAnchor.constraint(equalTo: nextGamesCollectionView.bottomAnchor, constant: 36),
            activeBetsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            betsTableView.topAnchor.constraint(equalTo: activeBetsLabel.bottomAnchor, constant: 20),
            betsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            betsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            betsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
