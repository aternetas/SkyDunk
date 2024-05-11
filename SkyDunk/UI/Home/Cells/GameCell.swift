//
//  GameCell.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    static let identifier = "GameCell"
    static let HEIGHT: CGFloat = 172
    
    lazy private var containerView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(resource: .backgroundGray)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy private var homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy private var guestTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy private var gameDateLab: UILabel = {
        let label = UILabel()
        label.textColor = .textDark
        label.font = UIFont(type: .extraLight, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var gameStartTimeLab: UILabel = {
        let label = UILabel()
        label.textColor = .textDark
        label.font = UIFont(type: .extraLight, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var gradientView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: GameVM) {
        DispatchQueue.main.async { [weak self] in
            self?.homeTeamImageView.image = vm.homeTeam.logo
            self?.guestTeamImageView.image = vm.guestTeam.logo
            self?.gameDateLab.text = vm.gameDate
            self?.gameStartTimeLab.text = vm.gameTime
            
            self?.gradientView.setColors(colors: [vm.homeTeam.color, vm.guestTeam.color])
        }
    }
    
    private func setupView() {
        addShadows()
    }
    
    private func initConstraints() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(gradientView)
        containerView.addSubview(homeTeamImageView)
        containerView.addSubview(guestTeamImageView)
        containerView.addSubview(gameDateLab)
        containerView.addSubview(gameStartTimeLab)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            gradientView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            gradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            gradientView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            gradientView.widthAnchor.constraint(equalToConstant: 11),
            
            homeTeamImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            homeTeamImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 2),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 30),
            
            guestTeamImageView.topAnchor.constraint(equalTo: homeTeamImageView.bottomAnchor, constant: 15),
            guestTeamImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 2),
            guestTeamImageView.heightAnchor.constraint(equalToConstant: 30),
            
            gameStartTimeLab.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 2),
            gameStartTimeLab.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            gameDateLab.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 2),
            gameDateLab.bottomAnchor.constraint(equalTo: gameStartTimeLab.topAnchor, constant: 0)
        ])
    }
}
