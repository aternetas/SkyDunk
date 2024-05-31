//
//  AlertModel.swift
//  SkyDunk
//
//  Created by aternetas on 31.05.2024.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let actions: [AlertActionModel]
    
    static func getBaseError(text: String) -> AlertModel {
        AlertModel(title: "ошибка",
                   message: text,
                   actions: [AlertActionModel(title: "ладно", action: { })])
    }
}

struct AlertActionModel {
    let title: String
    let action: () -> ()
}