//
//  ProfileController.swift
//  SkyDunk
//
//  Created by aternetas on 23.10.2024.
//

import UIKit

final class ProfileController: BaseController<ProfileViewModel> {
    
    private let rootView = ProfileView()
    
    override init() {
        super.init()
        
        viewModel = ProfileViewModel()
    }
    
    override func loadView() {
        super.loadView()
        
        rootView.backgroundColor = .atlantaHawks
        view = rootView
        
//        viewModel.getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        rootView.myBetsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabOnMyBetsView)))
    }
}
