//
//  TeamStatsView.swift
//  SkyDunk
//
//  Created by aternetas on 22.08.2024.
//

import Foundation
import UIKit
import SnapKit

class TeamStatsView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy var gradientView: GradientView = GradientView()
    
    lazy var title: UILabel = UILabel(font: .light12)
    
    lazy var teamLabel: UILabel = UILabel(font: .medium16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        layer.cornerRadius = 10
        addShadows()
    }
    
    private func initConstraints() {
        addSubview(containerView)
        containerView.addSubviews([
            gradientView,
            title,
            teamLabel
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
            make.leading.equalToSuperview().offset(29)
        }
        
        teamLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(29)
        }
    }
}
