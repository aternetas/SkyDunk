//
//  BetDTO.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

struct BetDTO: BetProtocol {
    
    let id: String
    let gameId: String
    let description: String
    let created: Date
    let amount: Double
    let coefficient: Double
    let betOn: [String]
    let isSuccess: Bool?
    
    func copy(isSuccess: Bool) -> BetDTO {
        BetDTO(id: id,
               gameId: gameId,
               description: description,
               created: created,
               amount: amount,
               coefficient: coefficient,
               betOn: betOn,
               isSuccess: isSuccess)
    }
}
