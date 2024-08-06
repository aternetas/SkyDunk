//
//  LastGameView.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class LastGameView: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var contentViewHC = contentView.heightAnchor.constraint(equalToConstant: 137)
    
    lazy private var titleLab = UILabel(text: "ПОСЛЕДНЯЯ ИГРА", font: .light18)
    
    lazy private var gameScoreLab: UILabel = {
        let label = UILabel(font: .medium20)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var gameDateLab = UILabel(font: .extraLight15)
    
    lazy private var homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy private var guestTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var emptyStateView: InfoView = .noLastGamesDataInfoView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: LastGameVM) {
        DispatchQueue.main.async { [weak self] in
            self?.homeTeamImageView.image = vm.homeTeam.logo
            self?.guestTeamImageView.image = vm.guestTeam.logo
            self?.gameScoreLab.text = vm.score
            self?.gameDateLab.text = vm.date
        }
    }
    
    func setVisibleComponents() {
        contentView.isHidden = contentViewHC.constant == 0 ? true : false
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        layer.cornerRadius = 10
        
        addShadows()
    }
    
    private func setupConstraints() {
        addSubviewsAndAutolayout([contentView,
                                  emptyStateView])
        contentView.addSubviewsAndAutolayout([titleLab,
                                  gameScoreLab,
                                  gameDateLab,
                                  homeTeamImageView,
                                  guestTeamImageView])
        
        NSLayoutConstraint.activate([
            emptyStateView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            emptyStateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            emptyStateView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            emptyStateView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contentViewHC,
            
            titleLab.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLab.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            gameScoreLab.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameScoreLab.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gameScoreLab.widthAnchor.constraint(equalToConstant: 100),
            
            gameDateLab.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameDateLab.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            homeTeamImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            homeTeamImageView.trailingAnchor.constraint(equalTo: gameScoreLab.leadingAnchor, constant: -10),
            homeTeamImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 50),
            
            guestTeamImageView.leadingAnchor.constraint(equalTo: gameScoreLab.trailingAnchor, constant: 10),
            guestTeamImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            guestTeamImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            guestTeamImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
