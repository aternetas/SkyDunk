//
//  LastGameVM.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import Foundation

struct LastGameVM {
    
    let id: String
    let homeTeam: TeamType
    let guestTeam: TeamType
    let score: String
    let date: String
    
    init(id: String, homeTeam: TeamType, guestTeam: TeamType, homeTeamScore: Int, guestTeamScore: Int, date: Date) {
        self.id = id
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.score = "\(homeTeamScore) : \(guestTeamScore)"
        self.date = date.toDayMonthYear()
    }
    
    init(game: Game) {
        self.init(id: game.id, 
                  homeTeam: game.homeTeam,
                  guestTeam: game.guestTeam,
                  homeTeamScore: game.homeScore,
                  guestTeamScore: game.guestScore,
                  date: game.gameDate)
    }
}
