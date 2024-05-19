//
//  GameHeaderVM.swift
//  SkyDunk
//
//  Created by aternetas on 12.05.2024.
//

import Foundation

struct GameHeaderVM {
    
    let homeTeam: TeamType
    let guestTeam: TeamType
    let score: String
    let date: String

    init(homeTeam: TeamType, guestTeam: TeamType, score: String, date: String) {
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.score = score
        self.date = date
    }

    init(game: Game) {
        self.init(homeTeam: game.homeTeam, 
                  guestTeam: game.guestTeam,
                  score: game.gameDate < Date() ? "\(game.homeScore) : \(game.guestScore)" : "",
                  date: game.gameDate.toDayMonthYear())
    }
}
