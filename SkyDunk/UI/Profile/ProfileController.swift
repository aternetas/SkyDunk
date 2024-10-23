//
//  ProfileController.swift
//  SkyDunk
//
//  Created by aternetas on 23.10.2024.
//

import UIKit

final class ProfileController: BaseController<ProfileViewModel> {
    
    private let rootView = ProfileView()
    
    override init() { super.init() }
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
        viewModel = ProfileViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getData()
//        rootView.myBetsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOnMyBetsView)))
    }
}

extension ProfileController: ProfileViewModelDelegate {
    
    func updateCurrentBalance(_ balance: Double) {
        rootView.balanceView.bind(balance: balance)
    }
}
