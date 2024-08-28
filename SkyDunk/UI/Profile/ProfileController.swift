//
//  ProfileController.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import UIKit
import RxCocoa

class ProfileController: RxBaseController<ProfileViewModel> {
    
    private let rootView = ProfileView()
    
    override init() {
        super.init()
        
        viewModel = ProfileViewModel()
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
        
        bindRx()
        viewModel.getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.myBetsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOnMyBetsView)))
    }
    
    private func bindRx() {
        viewModel.currentBalanceRelay
            .asSignal()
            .emit { [weak self] balance in
                self?.rootView.balanceView.bind(balance: balance)
            }.disposed(by: disposeBag)
        
        viewModel.generalStatisticsRelay
            .asSignal()
            .emit { [weak self] vm in
                self?.rootView.statisticsView.bind(vm: vm)
            }.disposed(by: disposeBag)
        
        viewModel.bestTeamStatisticsRelay
            .asSignal()
            .emit { [weak self] vm in
                self?.rootView.bestTeamStatsView.bind(vm: vm)
            }.disposed(by: disposeBag)
        
        viewModel.worstTeamStatisticsRelay
            .asSignal()
            .emit { [weak self] vm in
                self?.rootView.worstTeamStatsView.bind(vm: vm)
            }.disposed(by: disposeBag)
    }
    
    @objc func tabOnMyBetsView() {
        print("t")
    }
}
