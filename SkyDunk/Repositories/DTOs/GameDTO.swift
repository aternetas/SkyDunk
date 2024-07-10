//
//  GameDTO.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

struct GameDTO {
    
    let id: String
    let homeTeam: String
    let guestTeam: String
    let date: Date
    let homeScore: Int
    let guestScore: Int
    let activeBetsAmount: Int
    let betsResult: Double?
    
    func copy(isNewBet: Bool) -> GameDTO {
        GameDTO(id: id,
                homeTeam: homeTeam,
                guestTeam: guestTeam,
                date: date,
                homeScore: homeScore,
                guestScore: guestScore,
                activeBetsAmount: isNewBet ? activeBetsAmount + 1 : activeBetsAmount - 1,
                betsResult: betsResult)
    }
}
