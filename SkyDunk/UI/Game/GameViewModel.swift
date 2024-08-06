//
//  GameViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 12.05.2024.
//

import UIKit

protocol GameViewModelDelegat: AnyObject {
    func showGame(game: GameHeaderVM)
    func showBets()
    func updateBet(index: Int)
    func showEmptyState(isShow: Bool)
    func showNewBetButton()
}

class GameViewModel: BaseViewModel {
    
    private let betService = ServiceFactory.shared.betService
    private let gameService = ServiceFactory.shared.gameService
    
    weak var delegate: GameViewModelDelegat?
    var betsVM: [BetVM] = []
   
    private var gameId: String = ""
    
    func setGame(gameId: String) {
        self.gameId = gameId
        guard let game = gameService.getGameByGameId(gameId) else {
            showAlert(model: .getObjectNotExistError(type: .game))
            return
        }
        
        if game.date > Date.now {
            delegate?.showNewBetButton()
        }
        
        delegate?.showGame(game: GameHeaderVM(game: game))
        setBets()
    }
    
    func addNewBet() {
        navigationManager?.openScreen(screen: .newBet(gameId: gameId))
    }
    
    func updateBets() {
        setBets()
    }
    
    private func setBets() {
        betService.getBetsByGameId(gameId) { [weak self] res in
            guard let self = self else { return }
            switch res {
            case .success(let bets):
                betsVM = bets.map { BetVM(bet: $0, delegate: self) }
                delegate?.showEmptyState(isShow: betsVM.isEmpty)
                delegate?.showBets()
            case .failure(_):
                showAlert(model: .getObjectNotExistError(type: .bets))
            }
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
    
    func selectBet(id: String) {}
    
    private func changeBetStatus(id: String, isSuccess: Bool) {
        betService.editBet(id: id, isSuccess: isSuccess) { [weak self] res in
            switch res {
            case .success(_):
                self?.setBets()
            case .failure(_):
                self?.showAlert(model: .getCantUpdateObject(type: .bet))
            }
        }
    }
}
