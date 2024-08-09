//
//  GameRealmRepository.swift
//  SkyDunk
//
//  Created by Nebo on 14.07.2024.
//

import Foundation
import OSLog

class GameRealmRepository: LocalGameRepositoryProtocol {
    
    private static var fileName = #file.split(separator: "/").last as Any
    
    private let manager: RealmManager
    
    init(manager: RealmManager) {
        self.manager = manager
    }
    
    func getGames() throws -> [GameProtocol] {
        try manager.getAll(type: GameDTORealm.self)
    }
    
    func addNewBetToGame(gameId: String) throws {
        if let game = try manager.getById(id: gameId, type: GameDTORealm.self) {
            let modifiedGame = game.modify(activeBetsAmount: game.activeBetsAmount + 1)
            try manager.update(obj: modifiedGame)
        }
    }
    
    func changeGameBetsResult(gameId: String, betResult: Double) throws {
        if let game = try manager.getById(id: gameId, type: GameDTORealm.self) {
            let modifiedGame = game.modify(activeBetsAmount: game.activeBetsAmount - 1,
                                           betsResult: (game.betsResult ?? 0.0) + betResult)
            do {
                try manager.update(obj: modifiedGame)
            } catch {
                log(error.localizedDescription, funcName: #function)
                throw Errors.RealmError.cantUpdateObject
            }
        }
    }
    
    func updateGames(games: [GameProtocol]) throws {
        try games.forEach { game in
            try manager.update(type: GameDTORealm.self, values: [
                "id": game.id,
                "homeTeam": game.homeTeam,
                "guestTeam": game.guestTeam,
                "homeScore": game.homeScore,
                "date": game.date,
                "guestScore": game.guestScore
            ])
        }
    }
}

extension GameRealmRepository: MyLogger {
    
    func log(_ message: String, _ logType: OSLogType = .error, funcName: String) {
        Logger.createLog(message, logType, fileName: "\(GameRealmRepository.fileName)", funcName: funcName)
    }
}
