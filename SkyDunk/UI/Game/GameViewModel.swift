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
    func showNewBetButton()
}

class GameViewModel: BaseViewModel {
    
    private let betService = ServiceFactory.shared.betService
    private let gameService = ServiceFactory.shared.gameService
    
    var delegate: GameViewModelDelegat?
    var betsVM: [BetVM] = []
   
    private var gameId: String = ""
    
    func setGame(gameId: String) {
        self.gameId = gameId
        gameService.getGameByGameId(gameId) { [weak self] game in
            guard let game = game else {
                print("Error, empty game")
                return
            }
            
            if game.date > Date.now {
                self?.delegate?.showNewBetButton()
            }
            
            self?.delegate?.showGame(game: GameHeaderVM(game: game))
            self?.setBets()
        }
    }
    
    func addNewBet() {
        navigationManager?.openScreen(screen: .newBet(gameId: gameId))
    }
    
    func updateBets() {
        setBets()
    }
    
    private func setBets() {
        betService.getBetsByGameId(gameId) { [weak self] bets in
            guard let self = self else { return }
            betsVM = bets.map { BetVM(bet: $0, delegate: self) }
            
            delegate?.showEmptyState(isShow: betsVM.isEmpty)
            delegate?.showBets()
        }
    }
}

extension GameViewModel: BetCellListenerProtocol {
    
    func selectSuccessPrediction(id: String) {
        changeBetStatus(id: id, isSuccess: true)
    }
    
    func selectFailurePrediction(id: String) {
        changeBetStatus(id: id, isSuccess: false)
    }
    
    func selectBet(id: String) {
        guard let index = betsVM.firstIndex(where: { $0.id == id }) else { return }
        betsVM[index] = betsVM[index].copy(description: betsVM[index].description + " CHANGE")
        delegate?.updateBet(index: index)
    }
    
    private func changeBetStatus(id: String, isSuccess: Bool) {
        betService.editBet(id: id, isSuccess: isSuccess) { [weak self] in
            self?.setBets()
        }
    }
}
