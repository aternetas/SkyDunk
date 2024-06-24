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
    
    private let gameService = GameService(repository: GameRepository())
    
    var delegate: NewBetViewModelDelegat!
    
    private var game: Game?
    private var gameId: String = ""
    
    func setGame(gameId: String) {
        self.gameId = gameId
        let game = gameService.getGameByGameId(gameId)
        delegate?.setGameHeader(game: GameHeaderVM(game: game))
    }
    
    func saveNewBet(title: String, amount: String, coefficient: String) {
        if checkUserInput(title: title, amount: amount, coefficient: coefficient) {
            
        }
    }
    
    private func checkUserInput(title: String, amount: String, coefficient: String) -> Bool {
        let message: String = if title.isEmpty {
            "Прогноз не может быть пустым"
        } else if title.count < 5 {
            "Поле должно состоять минимум из 5-ти символов"
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
