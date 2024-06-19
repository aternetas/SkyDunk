//
//  BetDTO.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

struct BetDTO {
    
    let id = UUID().uuidString
    let description: String
    let date: Date
    let amount: Double
    let coefficient: Double
    let betOn: [TeamType]
    let isSuccess: Bool?
}
