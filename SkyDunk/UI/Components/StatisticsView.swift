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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        bindStatisticsView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        addShadows()
        layer.cornerRadius = 10
    }
    
    private func bindStatisticsView() {
        [TitleValueView(title: "Успешных ставок", value: "15"),
         TitleValueView(title: "Всего прогнозов", value: "10"),
         TitleValueView(title: "Процент побед", value: "74%")
        ].forEach { valuesContainer.addArrangedSubview($0) }
    }
    
    private func initConstraints() {
        addSubview(titleView)
        addSubview(separatorView)
        addSubview(valuesContainer)
        
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
