//
//  NewBetController.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import UIKit

class NewBetController: BaseController<NewBetViewModel> {
    
    private let rootView = NewBetView()
    
    override init() {
        super.init()
        
        viewModel = NewBetViewModel()
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}

extension NewBetController: NewBetViewModelDelegat {
    
    func setGameHeader(game: GameHeaderVM) {
        rootView.gameHeaderView.bind(vm: game)
    }
}
