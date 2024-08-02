//
//  LocalGameRepositoryProtocol.swift
//  SkyDunk
//
//  Created by Nebo on 14.07.2024.
//

import Foundation

protocol LocalGameRepositoryProtocol {
    
    func getGames() throws -> [GameProtocol]
    func addNewBetToGame(gameId: String) throws
    func changeGameBetsResult(gameId: String, betResult: Double) throws -> Bool
    func updateGames(games: [GameProtocol])
}
