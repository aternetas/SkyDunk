//
//  GameRepositoryProtocol.swift
//  SkyDunk
//
//  Created by Nebo on 14.07.2024.
//

import Foundation

protocol GameRepositoryProtocol {
    
    func getGames(completion: @escaping ([GameProtocol]) -> ())
    func addNewBetToGame(gameId: String, completion: @escaping (Bool) -> ())
    func changeGameBetsResult(gameId: String, betResult: Double, isSuccess: Bool, completion: @escaping (Bool) -> ())
}
