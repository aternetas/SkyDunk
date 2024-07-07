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
    
    lazy private var homeTeamLogo: UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy private var scoreLabel: UILabel = {
        let label = UILabel(font: UIFont(type: .light, size: 14), textColor: .textBlack)
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
        }
    }
    
    private func initConstraints() {
        contentView.addSubviewsAndAutolayout([shadowView, containerView])
        containerView.addSubviewsAndAutolayout([gradientView])
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.heightAnchor.constraint(equalToConstant: PastGameCell.HEIGHT),
            
            gradientView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            gradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            gradientView.widthAnchor.constraint(equalToConstant: 16),
            gradientView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
    }
}
