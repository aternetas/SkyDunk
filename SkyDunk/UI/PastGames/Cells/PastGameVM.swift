//
//  PastGameVM.swift
//  SkyDunk
//
//  Created by aternetas on 06.07.2024.
//

import Foundation

class PastGameVM {
    
    let homeTeam: TeamType
    let guestTeam: TeamType
    let score: String
    let date: String
    let betResult: String
    
    init(homeTeam: TeamType, guestTeam: TeamType, score: String, date: String, betResult: String) {
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.score = score
        self.date = date
        self.betResult = betResult
    }
    
    convenience init(game: Game) {
        self.init(homeTeam: game.homeTeam,
                  guestTeam: game.guestTeam,
                  score: "\(game.homeScore):\(game.guestScore)",
                  date: game.date.toDayMonthYear(),
                  betResult: "")
    }
}
