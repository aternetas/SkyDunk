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
        imageView.image = UIImage(systemName: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy private var guestTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
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
            
            gameDateLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameDateLab.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            homeTeamImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            homeTeamImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 50),
            
            guestTeamImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            guestTeamImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            guestTeamImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
