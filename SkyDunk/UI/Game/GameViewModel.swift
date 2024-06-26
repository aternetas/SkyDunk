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
    
    private let betService = BetService(repository: BetRepository())
    private let gameService = GameService(repository: GameRepository())
    
    var delegate: GameViewModelDelegat?
    var betsVM: [BetVM] = []
   
    private var gameId: String = ""
    
    func setGame(gameId: String) {
        self.gameId = gameId
        gameService.getGameByGameId(gameId) { [weak self] game in
            self?.delegate?.showGame(game: GameHeaderVM(game: game))
            self?.setBets()
        }
    }
    
    private func setBets() {
        betService.getBetsByGameId(gameId) { [weak self] bets in
            guard let self = self else { return }
            betsVM = bets.map { BetVM(bet: $0, delegate: self) }
            
            delegate?.showEmptyState(isShow: betsVM.isEmpty)
            delegate?.showBets()
        }
    }
    
    func addNewBet() {
        navigationManager?.openScreen(screen: .newBet(gameId: gameId))
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
