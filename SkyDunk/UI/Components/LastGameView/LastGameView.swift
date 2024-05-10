//
//  LastGameView.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class LastGameView: UIView {
    lazy private var titleLab: UILabel = {
        let label = UILabel()
        label.text = "КРАЙНЯЯ ИГРА"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var gameScoreLab: UILabel = {
        let label = UILabel()
        label.text = "91 : 102"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var gameDateLab: UILabel = {
        let label = UILabel()
        label.text = "10.05.2024"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .BOS)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy private var guestTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .CLE)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
            self?.homeTeamImageView.image = UIImage(named: vm.homeTeam)
            self?.guestTeamImageView.image = UIImage(named: vm.guestTeam)
            self?.gameScoreLab.text = vm.score
            self?.gameDateLab.text = vm.date
        }
    }
    
    private func setupConstraints() {
        addSubview(titleLab)
        addSubview(gameScoreLab)
        addSubview(gameDateLab)
        addSubview(homeTeamImageView)
        addSubview(guestTeamImageView)
        
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
    
    private func setupView() {
        layer.cornerRadius = 10
        
        addShadows()
    }
}
