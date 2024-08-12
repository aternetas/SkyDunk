//
//  ProfileController.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import Foundation

class ProfileController: BaseController<ProfileViewModel> {
    
    private let rootView = ProfileView()
    
    override init() {
        super.init()
        
        viewModel = ProfileViewModel()
        view = rootView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
