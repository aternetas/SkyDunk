//
//  GameService.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameService {
    private let repository: GameRepository
    private var games: [Game] = []
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func getGames(completion: @escaping ([Game]) -> ()) {
        repository.getGames { [weak self] dtos in
            self?.games = dtos.map { Game(dto: $0) }
            completion(self?.games ?? [])
        }
    }
    
    func getLastGame() -> Game {
        let lastGames = games.filter { Date.now > $0.date }
        var lastGame = lastGames[0]
        var distance = abs(Date.now.distance(to: lastGames[0].date))
        lastGames.forEach { game in
            let newDistance = Date.now.distance(to: game.date)
            if abs(newDistance) < distance {
                distance = newDistance
                lastGame = game
            }
        }
        return lastGame
    }
    
    func getNextGames() {
        
    }
}
