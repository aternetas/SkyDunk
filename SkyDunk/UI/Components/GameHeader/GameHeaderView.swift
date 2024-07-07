//
//  GameHeaderView.swift
//  SkyDunk
//
//  Created by aternetas on 12.05.2024.
//

import UIKit

class GameHeaderView: UIView {
    
    lazy private var versusLab = UILabel(text: "VS", font: UIFont(type: .regular, size: 30), textColor: .textBlack)
    
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
    
    lazy private var gameDateLab = UILabel(font: UIFont(type: .extraLight, size: 15), textColor: .textBlack)
    
    lazy private var gameScoreLab: UILabel = {
        let label = UILabel(font: UIFont(type: .medium, size: 20), textColor: .textBlack)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var gradientView: GradientView = {
        let view = GradientView()
        view.gradientDirection = .leftToRight
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: GameHeaderVM) {
        DispatchQueue.main.async { [weak self] in
            self?.homeTeamImageView.image = vm.homeTeam.logo
            self?.guestTeamImageView.image = vm.guestTeam.logo
            self?.gameDateLab.text = vm.date
            self?.gameScoreLab.text = vm.score
            
            self?.gradientView.setColors(colors: [vm.homeTeam.color, vm.guestTeam.color])
        }
    }
    
    private func setupConstraints() {
        addSubviewsAndAutolayout([versusLab,
                                  homeTeamImageView,
                                  guestTeamImageView,
                                  gameDateLab,
                                  gradientView,
                                  gameScoreLab])
        
        NSLayoutConstraint.activate([
            versusLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            versusLab.centerYAnchor.constraint(equalTo: centerYAnchor),
            versusLab.widthAnchor.constraint(equalToConstant: 45),
            
            homeTeamImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            homeTeamImageView.trailingAnchor.constraint(equalTo: versusLab.leadingAnchor, constant: -8),
            homeTeamImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 70),
            
            guestTeamImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            guestTeamImageView.leadingAnchor.constraint(equalTo: versusLab.trailingAnchor, constant: 8),
            guestTeamImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            guestTeamImageView.heightAnchor.constraint(equalToConstant: 70),
            
            gameDateLab.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            gameDateLab.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            gradientView.heightAnchor.constraint(equalToConstant: 3),
            
            gameScoreLab.bottomAnchor.constraint(equalTo: gradientView.topAnchor, constant: -20),
            gameScoreLab.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
