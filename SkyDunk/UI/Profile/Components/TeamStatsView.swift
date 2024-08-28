//
//  TeamStatsView.swift
//  SkyDunk
//
//  Created by aternetas on 22.08.2024.
//

import UIKit
import SnapKit

class TeamStatsView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var gradientView: GradientView = GradientView()
    private lazy var title: UILabel = UILabel(font: .light12)
    private lazy var teamLabel: UILabel = UILabel(font: .medium16)
    private lazy var teamIcon: UIImageView = UIImageView()
    
    private lazy var valuesContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 2.0
        view.distribution = .equalSpacing
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
    
    func bind(vm: TeamStatisticsVM) {
        title.text = switch vm.type {
        case .best:
            "НАИБОЛЬШИЙ ДОХОД"
        case .worst:
            "НАИБОЛЬШИЙ ПРОИГРЫШ"
        }
        
        gradientView.setColors(colors: [vm.team.color])
        teamLabel.text = vm.team.fullName
        teamIcon.image = vm.team.logo
        
        valuesContainer.removeSubviews()
        valuesContainer.createArrangedSubviews(vm.allCases)
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        layer.cornerRadius = 10
        addShadows()
        teamIcon.contentMode = .scaleAspectFit
    }
    
    private func initConstraints() {
        addSubview(containerView)
        containerView.addSubviews([
            gradientView,
            title,
            teamLabel,
            teamIcon,
            valuesContainer
        ])
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(13)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(gradientView.snp.trailing).offset(16)
        }
        
        teamLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.equalTo(gradientView.snp.trailing).offset(16)
        }
        
        teamIcon.snp.makeConstraints { make in
            make.top.equalTo(title)
            make.trailing.equalToSuperview().offset(-12)
            make.height.width.equalTo(55)
        }
        
        valuesContainer.snp.makeConstraints { make in
            make.top.equalTo(teamLabel.snp.bottom).offset(9)
            make.leading.equalTo(gradientView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
