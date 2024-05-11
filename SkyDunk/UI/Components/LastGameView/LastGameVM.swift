//
//  LastGameVM.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import Foundation

struct LastGameVM {
    
    let homeTeam: String
    let guestTeam: String
    let score: String
    let date: String
    
    init(homeTeam: String, guestTeam: String, homeTeamScore: Int, guestTeamScore: Int, date: Date) {
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.score = "\(homeTeamScore) : \(guestTeamScore)"
        self.date = date.toDayMonthYear()
    }
}
