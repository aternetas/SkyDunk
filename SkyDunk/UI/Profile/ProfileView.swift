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
    
    private lazy var statisticsView: StatisticsView = StatisticsView()
    
    private lazy var bestTeamStatsView: TeamStatsView = {
        let view = TeamStatsView()
        view.title.text = "НАИБОЛЬШИЙ ДОХОД"
        view.teamLabel.text = "Chicago Bulls"
        view.gradientView.setColors(colors: [.chicagoBulls])
        view.teamIcon.image = .CHI
        [TitleValueView(title: TitleType.sucessBetsAmount.rawValue, value: "15"),
         TitleValueView(title: TitleType.allBets.rawValue, value: "10"),
         TitleValueView(title: TitleType.winningProcent.rawValue, value: "74%"),
         TitleValueView(title: TitleType.commonEarnings.rawValue, value: "+1582")
        ].forEach { view.valuesContainer.addArrangedSubview($0) }
        return view
    }()
    
    private lazy var worstTeamStatsView: TeamStatsView = {
        let view = TeamStatsView()
        view.title.text = "НАИБОЛЬШИЙ ПРОИГРЫШ"
        view.teamLabel.text = "Orlando Magic"
        view.gradientView.setColors(colors: [.orlandoMagic])
        view.teamIcon.image = .ORL
        [TitleValueView(title: TitleType.sucessBetsAmount.rawValue, value: "15"),
         TitleValueView(title: TitleType.allBets.rawValue, value: "10"),
         TitleValueView(title: TitleType.winningProcent.rawValue, value: "74%"),
         TitleValueView(title: TitleType.commonEarnings.rawValue, value: "+1582")
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
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(87)
            make.height.equalTo(100)
            make.leading.trailing.equalTo(scrollView).inset(20)
            make.width.equalTo(scrollView).offset(-40)
        }
        
        statisticsView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(31)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(169)
        }
        
        bestTeamStatsView.snp.makeConstraints { make in
            make.top.equalTo(statisticsView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(147)
        }
        
        worstTeamStatsView.snp.makeConstraints { make in
            make.top.equalTo(bestTeamStatsView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(147)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
