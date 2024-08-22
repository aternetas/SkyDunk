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
    
    lazy var title: UILabel = UILabel(font: .light12)
    
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
        addSubview(title)
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(29)
        }
    }
}
