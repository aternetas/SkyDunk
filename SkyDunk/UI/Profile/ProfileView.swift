//
//  ProfileView.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import Foundation
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
        return view
    }()
    
    private lazy var worstTeamStatsView: TeamStatsView = {
        let view = TeamStatsView()
        view.title.text = "НАИБОЛЬШИЙ ПРОИГРЫШ"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .backgroundWhite
        initConstraints()
        tmp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tmp() {
//        scrollView.backgroundColor = .gray.withAlphaComponent(0.15)
//        statisticsView.backgroundColor = .systemYellow.withAlphaComponent(0.12)
//        stackView.backgroundColor = .green.withAlphaComponent(0.15)
    }
    
    private func initConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(statisticsView)
        scrollView.addSubview(bestTeamStatsView)
        scrollView.addSubview(worstTeamStatsView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(87)
            make.height.equalTo(100)
            make.leading.equalTo(scrollView).offset(20)
            make.trailing.equalTo(scrollView).offset(-20)
            make.width.equalTo(scrollView).offset(-40)
        }
        
        statisticsView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(169)
        }
        
        bestTeamStatsView.snp.makeConstraints { make in
            make.top.equalTo(statisticsView.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(147)
        }
        
        worstTeamStatsView.snp.makeConstraints { make in
            make.top.equalTo(bestTeamStatsView.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(147)
            make.bottom.equalToSuperview()
        }
    }
}
