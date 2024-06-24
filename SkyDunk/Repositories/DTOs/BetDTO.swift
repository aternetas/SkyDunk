//
//  BetDTO.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

struct BetDTO {
    
    let id: String
    let gameId: String
    let description: String
    let betCreated: Date
    let amount: Double
    let coefficient: Double
    let betOn: [String]
    let isSuccess: Bool?
}
