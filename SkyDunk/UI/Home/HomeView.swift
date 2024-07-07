//
//  HomeView.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class HomeView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        return view
    }()
    
    lazy var lastGameView = LastGameView()
    
    lazy var activeBetsLabel = {
        let label = UILabel(text: "АКТИВНЫЕ СТАВКИ",
                            font: UIFont(type: .light, size: 18),
                            textColor: .textBlack)
        label.isHidden = true
        return label
    }()
    
    private lazy var nextGameLabel = {
        let label = UILabel(text: "БЛИЖАЙШИЕ ИГРЫ",
                            font: UIFont(type: .light, size: 18),
                            textColor: .textBlack)
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
    
    lazy var betsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(BetCell.self, forCellReuseIdentifier: BetCell.identifier)
        return tableView
    }()
    
    lazy var betsTableViewHC = betsTableView.heightAnchor.constraint(equalToConstant: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundWhite
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints() {
        addSubviewsAndAutolayout([scrollView])
        scrollView.addSubviewsAndAutolayout([contentView])
        contentView.addSubviewsAndAutolayout([lastGameView,
                                  nextGameLabel,
                                  nextGamesCollectionView,
                                  activeBetsLabel,
                                  betsTableView])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            lastGameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lastGameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lastGameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lastGameView.heightAnchor.constraint(equalToConstant: 157),
            
            nextGameLabel.topAnchor.constraint(equalTo: lastGameView.bottomAnchor, constant: 40),
            nextGameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            nextGamesCollectionView.topAnchor.constraint(equalTo: nextGameLabel.bottomAnchor, constant: 20),
            nextGamesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            nextGamesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            nextGamesCollectionView.heightAnchor.constraint(equalToConstant: GameCell.HEIGHT),
            
            activeBetsLabel.topAnchor.constraint(equalTo: nextGamesCollectionView.bottomAnchor, constant: 36),
            activeBetsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            betsTableView.topAnchor.constraint(equalTo: activeBetsLabel.bottomAnchor, constant: 20),
            betsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            betsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            betsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            betsTableViewHC
        ])
    }
}
