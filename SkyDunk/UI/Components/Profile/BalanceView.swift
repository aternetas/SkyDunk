//
//  BalanceView.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import UIKit
import SnapKit

class BalanceView: UIView {
    
    var amount: Double = 50
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var title: UILabel = {
        let view = UILabel(text: "БАЛАНС", font: UIFont.light14)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var balanceConteinerView: UIView = UIView()
    
    private lazy var balanceLabel: UILabel = {
        let view = UILabel(text: "\(Int(amount))", font: UIFont.light18)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var coinImageView: UIImageView = UIImageView(image: .coinLogo)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addShadows()
        layer.cornerRadius = 10
    }

    private func initConstraints() {
        addSubview(contentView)
        contentView.addSubviews([title, balanceConteinerView])
        balanceConteinerView.addSubviews([balanceLabel, coinImageView])
        
        contentView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        balanceConteinerView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(4)
            make.centerX.bottom.equalToSuperview()
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }
        
        coinImageView.snp.makeConstraints { make in
            make.leading.equalTo(balanceLabel.snp.trailing).offset(3)
            make.trailing.equalTo(balanceConteinerView)
            make.centerY.equalTo(balanceLabel)
        }
    }
}
