//
//  LastGamesView.swift
//  SkyDunk
//
//  Created by aternetas on 06.07.2024.
//

import UIKit

class PastGamesView: UIView {
    
    lazy var activeBetsContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var activeBetsContainerViewHeight = activeBetsContainerView.heightAnchor.constraint(equalToConstant: 200)
    
    lazy var gamesWithActiveBetsCollectionView: UICollectionView = {
        let cvFlowLayout = UICollectionViewFlowLayout()
        cvFlowLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvFlowLayout)
        cv.register(GameCell.self, forCellWithReuseIdentifier: GameCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

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
        addSubviewsAndAutolayout([activeBetsContainerView,
                                  pastGamesTableView])
        
        activeBetsContainerView.addSubviewsAndAutolayout([gamesWithActiveBetsCollectionView,
                                                          separatorView])
        
        NSLayoutConstraint.activate([
            activeBetsContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            activeBetsContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            activeBetsContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            activeBetsContainerViewHeight,
            
            gamesWithActiveBetsCollectionView.topAnchor.constraint(equalTo: activeBetsContainerView.topAnchor, constant: 0),
            gamesWithActiveBetsCollectionView.leadingAnchor.constraint(equalTo: activeBetsContainerView.leadingAnchor, constant: 0),
            gamesWithActiveBetsCollectionView.trailingAnchor.constraint(equalTo: activeBetsContainerView.trailingAnchor, constant: 0),
            gamesWithActiveBetsCollectionView.heightAnchor.constraint(equalToConstant: GameCell.HEIGHT),
            
            separatorView.topAnchor.constraint(equalTo: gamesWithActiveBetsCollectionView.bottomAnchor, constant: 22),
            separatorView.leadingAnchor.constraint(equalTo: activeBetsContainerView.leadingAnchor, constant: 13),
            separatorView.trailingAnchor.constraint(equalTo: activeBetsContainerView.trailingAnchor, constant: -13),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            pastGamesTableView.topAnchor.constraint(equalTo: activeBetsContainerView.bottomAnchor, constant: 16),
            pastGamesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            pastGamesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            pastGamesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
