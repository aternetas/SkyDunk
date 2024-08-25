//
//  ProfileController.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import UIKit

class ProfileController: BaseController<ProfileViewModel> {
    
    private let rootView = ProfileView()
    
    override init() {
        super.init()
        
        viewModel = ProfileViewModel()
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        rootView.myBetsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOnMyBetsView)))
        viewModel.getCases()
    }
    
    @objc func tabOnMyBetsView() {
        print("t")
    }
}

extension ProfileController: ProfileViewModelDelegate {
    
    func updateCases(cases: StatisticsVM) {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.statisticsView.bind(vm: cases)
        }
    }
}
