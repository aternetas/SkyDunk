//
//  GameDTO.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

struct GameDTO {
    
    let id = UUID().uuidString
    let homeTeam: String
    let guestTeam: String
    let gameDate: Date
    let homeScore: Int
    let guestScore: Int
    let betIds: [String]
}
