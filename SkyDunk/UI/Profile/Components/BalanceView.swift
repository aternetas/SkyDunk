//
//  BalanceView.swift
//  SkyDunk
//
//  Created by aternetas on 24.10.2024.
//

import UIKit
import SnapKit

final class BalanceView: UIView {
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var title: UILabel = {
        let view = UILabel(text: "БАЛАНС", font: UIFont.light14)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var balanceConteinerView: UIView = UIView()
    
    private lazy var balanceLabel: UILabel = {
        let view = UILabel(font: UIFont.light18)
        view.textAlignment = .center
        return view
    }()
    
//    private lazy var coinImageView: UIImageView = UIImageView(image: .coinLogo)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(balance: Double) {
        balanceLabel.text = String(Int(balance))
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        addShadows()
        layer.cornerRadius = 10
    }

    private func initConstraints() {
        addSubview(contentView)
        contentView.addSubviews([title, balanceConteinerView])
//        balanceConteinerView.addSubviews([balanceLabel, coinImageView])
        balanceConteinerView.addSubviews([balanceLabel])
        
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
        
//        coinImageView.snp.makeConstraints { make in
//            make.leading.equalTo(balanceLabel.snp.trailing).offset(3)
//            make.trailing.equalTo(balanceConteinerView)
//            make.centerY.equalTo(balanceLabel)
//        }
    }
}
