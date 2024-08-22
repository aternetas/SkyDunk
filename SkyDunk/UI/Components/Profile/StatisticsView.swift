//
//  StatisticsView.swift
//  SkyDunk
//
//  Created by aternetas on 13.08.2024.
//

import Foundation
import UIKit
import SnapKit

class StatisticsView: UIView {
    
    private lazy var titleView: UILabel = UILabel(text: "СТАТИСТИКА", font: .light14)
    
    private lazy var separatorView: SeparatorView = SeparatorView()
    
    lazy var valuesContainer: UIStackView = {
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
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        addShadows()
        layer.cornerRadius = 10
    }
    
    private func bind() {
        [TitleValueView(title: TitleType.sucessBetsAmount.rawValue, value: "15"),
         TitleValueView(title: TitleType.allBets.rawValue, value: "10"),
         TitleValueView(title: TitleType.winningProcent.rawValue, value: "74%"),
         TitleValueView(title: TitleType.commonEarnings.rawValue, value: "+1582"),
         TitleValueView(title: TitleType.bestBet.rawValue, value: "+107"),
         TitleValueView(title: TitleType.worstBet.rawValue, value: "-67")
        ].forEach { valuesContainer.addArrangedSubview($0) }
    }
    
    private func initConstraints() {
        addSubviews([
            titleView,
            separatorView,
            valuesContainer
        ])
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.leading.equalToSuperview().offset(16)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(9)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        valuesContainer.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.trailing.bottom.equalToSuperview().offset(-16)
        }
    }
}
