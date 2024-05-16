//
//  GameViewModel.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import UIKit

protocol GameViewModelDelegat {
    func showGame(game: GameHeaderVM)
    func showBets()
    func updateBet(index: Int)
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
        
        delegate?.showBets()
    }
}

extension GameViewModel: BetCellListenerProtocol {
    
    func tapOnSuccessBet(id: String) {
        //тут какоето обращение в сервис
        guard let index = betsVM.firstIndex(where: { $0.id == id}) else { return }
        betsVM[index] = betsVM[index].copy(isActive: false, isSuccess: true)
        delegate?.updateBet(index: index)
    }
    
    func tapOnFailureBet(id: String) {
        
    }
    
    func tapOnBet(id: String) {
        
    }
}
