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
        
        viewModel.subject
            .asSignal()
            .emit { [weak self] vm in
                self?.rootView.statisticsView.bind(vm: vm)
            }.disposed(by: disposeBag)
        
        viewModel.getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.myBetsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOnMyBetsView)))
    }
    
    @objc func tabOnMyBetsView() {
        print("t")
    }
}
