//
//  PastGameVM.swift
//  SkyDunk
//
//  Created by aternetas on 06.07.2024.
//

import Foundation

protocol PastGameCellListenerProtocol {
    func selectGame(gameId: String)
}

class PastGameVM {
    
    let gameId: String
    let homeTeam: TeamType
    let guestTeam: TeamType
    let score: String
    let date: String
    let betsResult: Double?
    let delegate: PastGameCellListenerProtocol?
    
    init(gameId: String, homeTeam: TeamType, guestTeam: TeamType, score: String, date: String, betsResult: Double?, delegate: PastGameCellListenerProtocol?) {
        self.gameId = gameId
        self.homeTeam = homeTeam
        self.guestTeam = guestTeam
        self.score = score
        self.date = date
        self.betsResult = betsResult
        self.delegate = delegate
    }
    
    convenience init(game: Game, delegate: PastGameCellListenerProtocol?) {
        self.init(gameId: game.id,
                  homeTeam: game.homeTeam,
                  guestTeam: game.guestTeam,
                  score: "\(game.homeScore):\(game.guestScore)",
                  date: game.date.toDayMonthYear(),
                  betsResult: game.betsResult,
                  delegate: delegate)
    }
    
    func selectGame() {
        delegate?.selectGame(gameId: gameId)
    }
}
