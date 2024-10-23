//
//  GameModel.swift
//  SkyDunk
//
//  Created by aternetas on 23.07.2024.
//

import Foundation

struct GameModel: GameProtocol {
    
    var id: String
    var homeTeam: String
    var guestTeam: String
    var date: Date
    var homeScore: Int
    var guestScore: Int
    var activeBetsAmount: Int
    var betsResult: Double?
    
    init(id: String, homeTeam: String, guestTeam: String, date: Date, homeScore: Int, guestScore: Int, activeBetsAmount: Int, betsResult: Double? = nil) {
        self.id = id
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.date = date
        self.homeScore = homeScore
        self.guestScore = guestScore
        self.activeBetsAmount = activeBetsAmount
        self.betsResult = betsResult
    }
    
    init(model: RemoteGameModel) {
        self.init(id: String(model.id),
                  homeTeam: model.homeTeam.abbreviation,
                  guestTeam: model.guestTeam.abbreviation,
                  date: model.status.toDate() ?? model.date.toDate() ?? Date(),
                  homeScore: model.homeScore,
                  guestScore: model.guestScore,
                  activeBetsAmount: 0,
                  betsResult: nil)
    }
}
