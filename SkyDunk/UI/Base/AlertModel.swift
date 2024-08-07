//
//  AlertModel.swift
//  SkyDunk
//
//  Created by aternetas on 31.05.2024.
//

import Foundation

enum ObjectType: String {
    case game = "игра", bet = "ставка", bets = "ставки"
    
    var declensionForm: String {
        switch self {
        case .game: "игру"
        case .bet: "ставку"
        case .bets: "ставки"
        }
    }
}

struct AlertModel {
    let title: String
    let message: String
    let actions: [AlertActionModel]
    
    static func getBaseError(text: String) -> AlertModel {
        AlertModel(title: "Ошибка",
                   message: text,
                   actions: [AlertActionModel(title: "Ладно", action: { })])
    }
    
    static func getUserInputFailedValidationError(text: String) -> AlertModel {
        AlertModel(title: "Ошибка ввода",
                   message: text,
                   actions: [AlertActionModel(title: "Ладно", action: { })])
    }
    
    static func getObjectNotExistError(type: ObjectType) -> AlertModel {
        AlertModel(title: "Ошибка",
                   message: "Не удаётся найти \(type.declensionForm)",
                   actions: [AlertActionModel(title: "Ладно", action: { })])
    }
    
    static func getCantAddNewObjIn(type: ObjectType) -> AlertModel {
        AlertModel(title: "Ошибка",
                   message: "Не удаётся добавить новую \(type.declensionForm)",
                   actions: [AlertActionModel(title: "Ладно", action: { })])
    }
    
    static func getCantUpdateObject(type: ObjectType) -> AlertModel {
        AlertModel(title: "Ошибка",
                   message: "Не удаётся обновить \(type.declensionForm)",
                   actions: [AlertActionModel(title: "Ладно", action: { })])
    }
}

struct AlertActionModel {
    let title: String
    let action: () -> ()
}
