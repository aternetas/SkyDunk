//
//  GameViewModel.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import UIKit

protocol GameViewModelDelegat {
    func showGame(game: GameHeaderVM)
}

class GameViewModel: BaseViewModel {
    
    var delegate: GameViewModelDelegat?
    
    func setGame(game: Game) {
        delegate?.showGame(game: GameHeaderVM(game: game))
    }
}
