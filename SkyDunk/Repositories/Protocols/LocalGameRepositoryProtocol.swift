//
//  LocalGameRepositoryProtocol.swift
//  SkyDunk
//
//  Created by Nebo on 14.07.2024.
//

import Foundation

protocol LocalGameRepositoryProtocol {
    
    func getGames() -> [GameProtocol]
    func addNewBetToGame(gameId: String, completion: @escaping (Bool) -> ())
    func changeGameBetsResult(gameId: String, betResult: Double, completion: @escaping (Bool) -> ())
    func updateGames(games: [GameProtocol], completion: @escaping () -> ())
}
