//
//  StatisticsView.swift
//  SkyDunk
//
//  Created by aternetas on 13.08.2024.
//

import UIKit
import SnapKit

enum StatisticsTitle: String {
    
    case sucessBetsAmount = "Успешных ставок"
    case allBets = "Всего прогнозов"
    case winningProcent = "Процент побед"
    case commonEarnings = "Общий доход"
    case bestBet = "Лучшая ставка"
    case worstBet = "Худшая ставка"
}

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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        addShadows()
        layer.cornerRadius = 10
    }
    
    func bind(vm: StatisticsVM) {
        [TitleValueView(title: StatisticsTitle.sucessBetsAmount.rawValue, value: vm.successBetsCount),
         TitleValueView(title: StatisticsTitle.allBets.rawValue, value: vm.allBetsCount),
         TitleValueView(title: StatisticsTitle.winningProcent.rawValue, value: vm.winningProcent),
         TitleValueView(title: StatisticsTitle.commonEarnings.rawValue, value: vm.commonEarnings),
         TitleValueView(title: StatisticsTitle.bestBet.rawValue, value: vm.bestBet),
         TitleValueView(title: StatisticsTitle.worstBet.rawValue, value: vm.worstBet)
        ].forEach { valuesContainer.addArrangedSubview($0) }
    }
    
    private func initConstraints() {
        addSubviews([titleView, separatorView, valuesContainer])
        
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
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
}
