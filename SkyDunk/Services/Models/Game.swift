//
//  Game.swift
//  SkyDunk
//
//  Created by aternetas on 12.05.2024.
//

import Foundation

struct Game {
    
    let id: String
    let homeTeam: TeamType
    let guestTeam: TeamType
    let date: Date
    let homeScore: Int
    let guestScore: Int
    let betIds: [String]
    
    init(id: String, homeTeam: TeamType, guestTeam: TeamType, date: Date, homeScore: Int, guestScore: Int, betIds: [String]) {
        self.id = id
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.date = date
        self.homeScore = homeScore
        self.guestScore = guestScore
        self.betIds = betIds
    }
    
    init(dto: GameDTO) {
        self.init(id: dto.id,
                  homeTeam: TeamType(rawValue: dto.homeTeam) ?? .other,
                  guestTeam: TeamType(rawValue: dto.guestTeam) ?? .other,
                  date: dto.date,
                  homeScore: dto.homeScore,
                  guestScore: dto.guestScore,
                  betIds: dto.betIds)
    }
}
