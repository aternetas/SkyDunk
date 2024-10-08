//
//  NewBetViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import Foundation

protocol NewBetViewModelDelegat: AnyObject {
    func setGameHeader(game: GameHeaderVM)
    func dismiss()
}

class NewBetViewModel: BaseViewModel, MyLogger {
    
    private let gameService = ServiceFactory.shared.gameService
    private let betService = ServiceFactory.shared.betService
    
    weak var delegate: NewBetViewModelDelegat?
    
    private var game: Game?
    private var gameId: String = ""
    
    func setGame(gameId: String) {
        self.gameId = gameId

        if let game = gameService.getGameByGameId(gameId) {
            self.game = game
            delegate?.setGameHeader(game: GameHeaderVM(game: game))
        } else {
            logError("Game with id: \(gameId) is missing", funcName: #function)
            showAlert(model: .getObjectNotExistError(type: .game))
        }
    }
    
    func saveNewBet(description: String, amount: String, coefficient: String) {
        if checkUserInput(description: description, amount: amount, coefficient: coefficient) {
            guard let game = game else { return }
            betService.addBet(description: description,
                              amount: Double(amount)!,
                              coefficient: Double(coefficient)!,
                              betOn: [game.homeTeam.rawValue, game.guestTeam.rawValue],
                              gameId: gameId) { [weak self] res in
                switch res {
                case .success(_):
                    self?.delegate?.dismiss()
                case .failure(let error):
                    self?.logError(error.localizedDescription, funcName: #function)
                    self?.showAlert(model: .getCantAddNewObjIn(type: .bet))
                }
            }
        }
    }
    
    private func checkUserInput(description: String, amount: String, coefficient: String) -> Bool {
        let message: String = if description.isEmpty {
            "Прогноз не может быть пустым"
        } else if description.count < 5 {
            "Поле прогноза должно состоять минимум из 5-ти символов"
        } else if amount.isEmpty || Double(amount) == nil {
            "Некорректные данные в поле \("Ставка")"
        } else if Double(amount)! < 1 {
            "Минимальная ставка: 1 балл"
        } else if coefficient.isEmpty || Double(coefficient) == nil {
            "Некорректные данные в поле \("Коэффициент")"
        } else if Double(coefficient)! <= 0.0 {
            "Коэффициент должен быть выше нуля"
        } else {
            ""
        }
        
        if !message.isEmpty {
            showAlert(model: AlertModel.getUserInputFailedValidationError(text: message))
        }
        
        return message.isEmpty
    }
}
