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
        rootView.saveBetButton.addTarget(self, action: #selector(clickOnSaveBetButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    @objc private func clickOnSaveBetButton() {
        viewModel.saveNewBet(description: rootView.betDescriptionTextField.text,
                             amount: rootView.betAmountTextField.text,
                             coefficient: rootView.betCoefficientTextField.text)
    }
}

extension NewBetController: NewBetViewModelDelegat {
    
    func setGameHeader(game: GameHeaderVM) {
        rootView.gameHeaderView.bind(vm: game)
    }
    
    func dismiss() {
        presentingViewController?.dismissModal()
        dismiss(animated: true)
    }
}
