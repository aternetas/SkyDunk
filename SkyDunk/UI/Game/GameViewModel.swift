//
//  GameViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 12.05.2024.
//

import UIKit

protocol GameViewModelDelegat {
    func showGame(game: GameHeaderVM)
    func showBets()
    func updateBet(index: Int)
    func showEmptyState(isShow: Bool)
}

class GameViewModel: BaseViewModel {
    
    var delegate: GameViewModelDelegat?
    var betsVM: [BetVM] = []
    private var game: Game?
    
    func setGame(game: Game) {
        self.game = game
        delegate?.showGame(game: GameHeaderVM(game: game))
        setBets()
    }
    
    func setBets() {
        guard let bets = game?.bets else { return }
        betsVM = bets.map( { BetVM(bet: $0, delegate: self) } )
        
        delegate?.showEmptyState(isShow: betsVM.isEmpty)
        delegate?.showBets()
    }
    
    func addNewBet() {
        guard let game = game else { return }
        navigationManager?.openScreen(screen: .newBet(game: game))
    }
}

extension GameViewModel: BetCellListenerProtocol {
    
    func tapOnSuccessBet(id: String) {
        changeBetStatus(id: id, isSuccess: true)
    }
    
    func tapOnFailureBet(id: String) {
        changeBetStatus(id: id, isSuccess: false)
    }
    
    func tapOnBet(id: String) {
        guard let index = betsVM.firstIndex(where: { $0.id == id}) else { return }
        betsVM[index] = betsVM[index].copy(description: betsVM[index].description + " CHANGE")
        delegate?.updateBet(index: index)
    }
    
    private func changeBetStatus(id: String, isSuccess: Bool) {
        guard let index = betsVM.firstIndex(where: { $0.id == id}) else { return }
        betsVM[index] = betsVM[index].copy(isActive: false, isSuccess: isSuccess)
        delegate?.updateBet(index: index)
    }
}
