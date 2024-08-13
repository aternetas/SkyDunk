//
//  BalanceView.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import Foundation
import UIKit
import SnapKit

class BalanceView: UIView {
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var title: UILabel = {
        let view = UILabel(text: "БАЛАНС", font: UIFont.light14)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var balanceConteinerView: UIView = UIView()
    
    private lazy var balanceLabel: UILabel = {
        let view = UILabel(text: "67", font: UIFont.light18)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var coinImageView: UIImageView = UIImageView(image: .coinLogo)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
        tmp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addShadows()
        layer.cornerRadius = 10
    }
    
    private func tmp() {
        contentView.backgroundColor = .green.withAlphaComponent(0.3)
        balanceConteinerView.backgroundColor = .purple.withAlphaComponent(0.45)
    }
    
    private func initConstraints() {
        addSubview(contentView)
        contentView.addSubview(title)
        contentView.addSubview(balanceConteinerView)
        balanceConteinerView.addSubview(balanceLabel)
        balanceConteinerView.addSubview(coinImageView)
        
        contentView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView)
            make.top.equalTo(contentView.snp.top)
        }
        
        balanceConteinerView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(4)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(balanceConteinerView)
            make.leading.equalTo(balanceConteinerView.snp.leading)
        }
        
        coinImageView.snp.makeConstraints { make in
            make.leading.equalTo(balanceLabel.snp.trailing).offset(3)
            make.trailing.equalTo(balanceConteinerView.snp.trailing)
            make.centerY.equalTo(balanceLabel.snp.centerY)
        }
    }
}
