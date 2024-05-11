//
//  HomeController.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class HomeController: UIViewController {
    
    private let viewModel = HomeViewModel()//just temporary
    private let rootView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getLastGame()
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}

extension HomeController: HomeViewModelDelegat {
    func updateLastGame(vm: LastGameVM) {
        rootView.lastGameView.bind(vm: vm)
    }
}
