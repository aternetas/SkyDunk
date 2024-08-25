//
//  ProfileView.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    private lazy var scrollView: UIScrollView = UIScrollView()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20.0
        view.distribution = .fillEqually
        [balanceView, myBetsView, InfoView(text: "Что-то ещё")].forEach { view.addArrangedSubview($0) }
        return view
    }()
    
    private lazy var balanceView: BalanceView = {
        let view = BalanceView()
        view.backgroundColor = .backgroundGray
        return view
    }()
    
    lazy var myBetsView: InfoView = InfoView(text: "Moи ставки")
    
    lazy var statisticsView: StatisticsView = StatisticsView()
    
    lazy var bestTeamStatsView: TeamStatsView = {
        let view = TeamStatsView()
        view.title.text = "НАИБОЛЬШИЙ ДОХОД"
        view.teamLabel.text = "Chicago Bulls"
        view.gradientView.setColors(colors: [.chicagoBulls])
        view.teamIcon.image = .CHI
        [TitleValueView(title: StatisticsTitle.sucessBetsAmount.rawValue, value: "15"),
         TitleValueView(title: StatisticsTitle.allBets.rawValue, value: "10"),
         TitleValueView(title: StatisticsTitle.winningProcent.rawValue, value: "74%"),
         TitleValueView(title: StatisticsTitle.commonEarnings.rawValue, value: "+1582")
        ].forEach { view.valuesContainer.addArrangedSubview($0) }
        return view
    }()
    
    private lazy var worstTeamStatsView: TeamStatsView = {
        let view = TeamStatsView()
        view.title.text = "НАИБОЛЬШИЙ ПРОИГРЫШ"
        view.teamLabel.text = "Orlando Magic"
        view.gradientView.setColors(colors: [.orlandoMagic])
        view.teamIcon.image = .ORL
        [TitleValueView(title: StatisticsTitle.sucessBetsAmount.rawValue, value: "15"),
         TitleValueView(title: StatisticsTitle.allBets.rawValue, value: "10"),
         TitleValueView(title: StatisticsTitle.winningProcent.rawValue, value: "74%"),
         TitleValueView(title: StatisticsTitle.commonEarnings.rawValue, value: "+1582")
        ].forEach { view.valuesContainer.addArrangedSubview($0) }
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .backgroundWhite
        initConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints() {
        addSubview(scrollView)
        scrollView.addSubviews([
            stackView,
            statisticsView,
            bestTeamStatsView,
            worstTeamStatsView
        ])
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(0)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(100)
            make.leading.trailing.equalTo(scrollView).inset(20)
            make.width.equalTo(scrollView).offset(-40)
        }
        
        statisticsView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(31)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        bestTeamStatsView.snp.makeConstraints { make in
            make.top.equalTo(statisticsView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        worstTeamStatsView.snp.makeConstraints { make in
            make.top.equalTo(bestTeamStatsView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-6)
        }
    }
}
