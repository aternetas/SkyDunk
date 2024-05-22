//
//  NewBetViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import Foundation

class NewBetViewModel: BaseViewModel {
    
    private var game: Game?
    
    func setGame(game: Game) {
        self.game = game
    }
}
