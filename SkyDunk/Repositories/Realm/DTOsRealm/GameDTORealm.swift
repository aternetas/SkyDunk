//
//  GameDTORealm.swift
//  SkyDunk
//
//  Created by Nebo on 14.07.2024.
//

import Foundation
import RealmSwift

class GameDTORealm: Object, GameProtocol {

    @Persisted var id: String
    @Persisted var homeTeam: String
    @Persisted var guestTeam: String
    @Persisted var date: Date
    @Persisted var homeScore: Int
    @Persisted var guestScore: Int
    @Persisted var activeBetsAmount: Int
    @Persisted var betsResult: Double?
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(id: String, homeTeam: String, guestTeam: String, date: Date, homeScore: Int, guestScore: Int, activeBetsAmount: Int, betsResult: Double? = nil) {
        self.init()
        self.id = id
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.date = date
        self.homeScore = homeScore
        self.guestScore = guestScore
        self.activeBetsAmount = activeBetsAmount
        self.betsResult = betsResult
    }
    
    func modify(activeBetsAmount: Int, betsResult: Double? = nil) -> GameDTORealm {
        GameDTORealm(id: id,
                     homeTeam: homeTeam,
                     guestTeam: guestTeam,
                     date: date,
                     homeScore: homeScore,
                     guestScore: guestScore,
                     activeBetsAmount: activeBetsAmount,
                     betsResult: betsResult ?? self.betsResult)
    }
}
