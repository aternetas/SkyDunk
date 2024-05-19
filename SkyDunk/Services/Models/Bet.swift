//
//  Bet.swift
//  SkyDunk
//
//  Created by aternetas on 15.05.2024.
//

import Foundation

struct Bet {
    
    let id = UUID().uuidString
    let description: String
    let date: Date
    let amount: Double
    let coefficient: Double
    let teams: [TeamType]
    let isSuccess: Bool?
}
