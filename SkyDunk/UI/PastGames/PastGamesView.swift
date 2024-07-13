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
        view.clipsToBounds = true
        return view
    }()
    
    lazy var activeBetsContainerHC = activeBetsContainerView.heightAnchor.constraint(equalToConstant: 0)
    
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
    
    private lazy var specifyBetsResultLabel: UILabel = {
        let label = UILabel(text: "Необходимо указать результаты игры", font: .extraLight15)
        label.isHidden = true
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray3
        view.isHidden = true
        return view
    }()
    
    lazy var emptyStateView: InfoView = {
        let infoView = InfoView(text: "Не удалось получить информацию по прошедшим играм")
        infoView.isHidden = true
        return infoView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        if activeBetsContainerHC.constant != 0 {
            specifyBetsResultLabel.isHidden = false
            separatorView.isHidden = false
        }
    }
    
    public func initConstraints() {
        addSubviewsAndAutolayout([activeBetsContainerView,
                                  pastGamesTableView,
                                  emptyStateView])
        
        activeBetsContainerView.addSubviewsAndAutolayout([specifyBetsResultLabel,
                                                          gamesWithActiveBetsCollectionView,
                                                          separatorView])
        
        NSLayoutConstraint.activate([
            activeBetsContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            activeBetsContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            activeBetsContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            activeBetsContainerHC,
            
            emptyStateView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            emptyStateView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            emptyStateView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emptyStateView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emptyStateView.heightAnchor.constraint(equalToConstant: 157),
            
            specifyBetsResultLabel.topAnchor.constraint(equalTo: activeBetsContainerView.topAnchor, constant: 6),
            specifyBetsResultLabel.leadingAnchor.constraint(equalTo: activeBetsContainerView.leadingAnchor, constant: 16),
            
            gamesWithActiveBetsCollectionView.topAnchor.constraint(equalTo: specifyBetsResultLabel.bottomAnchor, constant: 10),
            gamesWithActiveBetsCollectionView.leadingAnchor.constraint(equalTo: activeBetsContainerView.leadingAnchor, constant: 8),
            gamesWithActiveBetsCollectionView.trailingAnchor.constraint(equalTo: activeBetsContainerView.trailingAnchor, constant: -8),
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
