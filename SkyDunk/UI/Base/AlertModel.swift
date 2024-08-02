//
//  AlertModel.swift
//  SkyDunk
//
//  Created by aternetas on 31.05.2024.
//

import Foundation

enum ObjectType: String {
    case game = "Игра", bet = "Ставка"
    
    func getDeclensionForm() -> String {
        switch self {
        case .game: "Игру"
        case .bet: "Ставку"
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
                   actions: [AlertActionModel(title: "Ладно", action: {})])
    }
    
    static func getUserInputFailedValidationError(text: String) -> AlertModel {
        AlertModel(title: "Ошибка ввода",
                   message: text,
                   actions: [AlertActionModel(title: "Ладно", action: {})])
    }
    
    static func cantAddNewObjInDB(type: ObjectType) -> AlertModel {
        AlertModel(title: "Ошибка добавления",
                   message: "Не получилось разместить \(type.getDeclensionForm().lowercased()) в базе данных",
                   actions: [AlertActionModel(title: "Ладно", action: {})])
    }
    
    static func objDoesNotExist(type: ObjectType) -> AlertModel {
        AlertModel(title: "Ошибка",
                   message: "\(type.rawValue) отсутствует в базе данных",
                   actions: [AlertActionModel(title: "Жаль", action: {})])
    }
}

struct AlertActionModel {
    let title: String
    let action: () -> ()
}
