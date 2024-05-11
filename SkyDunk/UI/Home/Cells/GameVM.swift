//
//  GameVM.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import UIKit

class GameVM {
    
    let homeTeam: TeamType
    let guestTeam: TeamType
    let gameDate: String
    let gameTime: String
    
    init(homeTeam: TeamType, guestTeam: TeamType, gameDate: Date) {
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.gameDate = gameDate.toDayMonthYear()
        self.gameTime = gameDate.toHourMinute()
    }
}
