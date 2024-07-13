//
//  GameVM.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

class GameVM {
    
    let id: String
    let homeTeam: TeamType
    let guestTeam: TeamType
    let gameDate: String
    let gameTime: String
    
    init(id: String, homeTeam: TeamType, guestTeam: TeamType, gameDate: Date) {
        self.id = id
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.gameDate = gameDate.toDayMonthYear()
        self.gameTime = gameDate.toHourMinute()
    }
    
    convenience init(game: Game) {
        self.init(id: game.id, homeTeam: game.homeTeam, guestTeam: game.guestTeam, gameDate: game.date)
    }
}
