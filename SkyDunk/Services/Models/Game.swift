//
//  Game.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import Foundation

struct Game {
    let id = UUID().uuidString
    let homeTeam: TeamType
    let guestTeam: TeamType
    let gameDate: Date
    let homeScore: Int
    let guestScore: Int
}
