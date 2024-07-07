//
//  PastGameCell.swift
//  SkyDunk
//
//  Created by aternetas on 06.07.2024.
//

import UIKit

class PastGameCell: UITableViewCell {
    
    static let identifier = "PastGameCell"
    static let HEIGHT: CGFloat = 88
    
    lazy private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy private var shadowView: UIView = {
        let view = UIView()
        view.addShadows()
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var gradientView: GradientView = {
        let view = GradientView()
        return view
    }()
    
    lazy private var homeTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy private var scoreLabel: UILabel = {
        let label = UILabel(font: .light14)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var guestTeamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy private var dateLabel: UILabel = {
        let label = UILabel(font: UIFont(type: .extraLight, size: 14))
        label.textAlignment = .right
        return label
    }()
    
    lazy private var betResultLabel: UILabel = {
        let label = UILabel(font: .extraLight12)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: PastGameVM) {
        DispatchQueue.main.async { [weak self] in
            self?.gradientView.setColors(colors: [vm.homeTeam.color.withAlphaComponent(0.5), vm.guestTeam.color.withAlphaComponent(0.5)])
            self?.homeTeamImageView.image = vm.homeTeam.logo
            self?.scoreLabel.text = vm.score
            self?.guestTeamImageView.image = vm.guestTeam.logo
            self?.dateLabel.text = vm.date
            
            self?.betResultLabel.textColor = .red
            self?.betResultLabel.text = "+18.4"
        }
    }
    
    private func initConstraints() {
        contentView.addSubviewsAndAutolayout([shadowView, containerView])
        containerView.addSubviewsAndAutolayout([gradientView,
                                               homeTeamImageView,
                                               scoreLabel,
                                               guestTeamImageView,
                                               dateLabel,
                                               betResultLabel])
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            gradientView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            gradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            gradientView.widthAnchor.constraint(equalToConstant: 16),
            gradientView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            
            scoreLabel.leadingAnchor.constraint(equalTo: gradientView.trailingAnchor, constant: 69),
            scoreLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            scoreLabel.widthAnchor.constraint(equalToConstant: 53),
            
            homeTeamImageView.leadingAnchor.constraint(greaterThanOrEqualTo: gradientView.trailingAnchor, constant: 19),
            homeTeamImageView.trailingAnchor.constraint(lessThanOrEqualTo: scoreLabel.leadingAnchor, constant: -8),
            homeTeamImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            homeTeamImageView.heightAnchor.constraint(equalToConstant: 35),
            homeTeamImageView.widthAnchor.constraint(equalToConstant: 40),
            
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            guestTeamImageView.leadingAnchor.constraint(lessThanOrEqualTo: scoreLabel.trailingAnchor, constant: 8),
            guestTeamImageView.trailingAnchor.constraint(lessThanOrEqualTo: dateLabel.leadingAnchor, constant: -100),
            guestTeamImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            guestTeamImageView.heightAnchor.constraint(equalToConstant: 35),
            guestTeamImageView.widthAnchor.constraint(equalToConstant: 40),
            
            betResultLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24),
            betResultLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            betResultLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
}
