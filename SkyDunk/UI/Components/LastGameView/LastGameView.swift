//
//  LastGameView.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class LastGameView: UIView {
    
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
    
    private func setupView() {
        backgroundColor = .backgroundGray
        layer.cornerRadius = 10
        
        addShadows()
    }
    
    private func setupConstraints() {
        addSubviewsAndAutolayout([titleLab,
                                  gameScoreLab,
                                  gameDateLab,
                                  homeTeamImageView,
                                  guestTeamImageView])
        
        NSLayoutConstraint.activate([
            titleLab.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            gameScoreLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameScoreLab.centerYAnchor.constraint(equalTo: centerYAnchor),
            gameScoreLab.widthAnchor.constraint(equalToConstant: 100),
            
            gameDateLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameDateLab.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            homeTeamImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            homeTeamImageView.trailingAnchor.constraint(equalTo: gameScoreLab.leadingAnchor, constant: -10),
            homeTeamImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 50),
            
            guestTeamImageView.leadingAnchor.constraint(equalTo: gameScoreLab.trailingAnchor, constant: 10),
            guestTeamImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            guestTeamImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            guestTeamImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
