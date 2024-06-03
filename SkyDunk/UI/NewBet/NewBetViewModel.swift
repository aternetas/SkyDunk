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
    
    func saveNewBet(title: String, amount: String, coefficient: String) {
        if title.isEmpty {
            showAlert(model: AlertModel.getBaseError(text: "Прогноз не может быть пустым"))
        } else if title.count <= 5 {
            showAlert(model: AlertModel.getBaseError(text: "Поле должно состоять минимум из 5-ти символов"))
        } else if amount.isEmpty || Double(amount) == nil {
            showAlert(model: AlertModel.getBaseError(text: "Некорректные данные в поле \("Ставка")"))
        } else if coefficient.isEmpty || Double(coefficient) == nil {
            showAlert(model: AlertModel.getBaseError(text: "Некорректные данные в поле \("Коэффициент")"))
        }
    }
}
