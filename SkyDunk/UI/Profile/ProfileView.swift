//
//  ProfileView.swift
//  SkyDunk
//
//  Created by aternetas on 23.10.2024.
//

import UIKit
import SnapKit

final class ProfileView: UIView {
    
    private lazy var scrollView: UIScrollView = UIScrollView()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20.0
        view.distribution = .fillEqually
        [balanceView, myBetsView, InfoView(text: "ЕЩË ЧТО-ТО")].forEach { view.addArrangedSubview($0) }
        return view
    }()
    
    lazy var balanceView: BalanceView = BalanceView()
    lazy var myBetsView: InfoView = InfoView(text: "МОИ СТАВКИ")
//    lazy var statisticsView: StatisticsView = StatisticsView()
//    lazy var bestTeamStatsView: TeamStatsView = TeamStatsView()
//    lazy var worstTeamStatsView: TeamStatsView = TeamStatsView()
    
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
//            statisticsView,
//            bestTeamStatsView,
//            worstTeamStatsView
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
        
//        statisticsView.snp.makeConstraints { make in
//            make.top.equalTo(stackView.snp.bottom).offset(31)
//            make.leading.trailing.equalToSuperview().inset(20)
//        }
//        
//        bestTeamStatsView.snp.makeConstraints { make in
//            make.top.equalTo(statisticsView.snp.bottom).offset(14)
//            make.leading.trailing.equalToSuperview().inset(20)
//        }
//        
//        worstTeamStatsView.snp.makeConstraints { make in
//            make.top.equalTo(bestTeamStatsView.snp.bottom).offset(14)
//            make.leading.trailing.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().offset(-6)
//        }
    }
}
