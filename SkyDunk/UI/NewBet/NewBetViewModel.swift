//
//  NewBetViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import Foundation

protocol NewBetViewModelDelegat {
    func setGameHeader(game: GameHeaderVM)
}

class NewBetViewModel: BaseViewModel {
    
    var delegate: NewBetViewModelDelegat!
    
    private var game: Game?
    
    func setGame(game: Game) {
        self.game = game
        delegate?.setGameHeader(game: GameHeaderVM(game: game))
    }
    
    func saveNewBet() {
        
    }
}
