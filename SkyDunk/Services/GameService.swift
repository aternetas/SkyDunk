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
    private var pastGames: [Game] =  []
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func getGames(completion: @escaping ([Game]) -> ()) {
        repository.getGames { [weak self] dtos in
            self?.games = dtos.map { Game(dto: $0) }
            completion(self?.games ?? [])
        }
    }
    
    func getGameByGameId(_ gameId: String, completion: @escaping (Game?) -> ()) {
        repository.getGames { dtos in
            completion(dtos.first(where: { $0.id == gameId }).map { Game(dto: $0) })
        }
    }
    
    func getLastGame() -> Game? {
        games.filter { Date.now > $0.date }.sorted { $0.date > $1.date }.first
    }
    
    func getNextGames() -> [Game] {
        Array<Game>(games.filter { Date.now < $0.date }
            .sorted { $0.date < $1.date }
            .prefix(10))
    }
    
    func getPastGames() -> [Game] {
        pastGames = Array<Game>(games.filter { Date.now > $0.date } )
            .sorted { $0.date > $1.date }
            .filter { $0.homeScore != 0 || $0.guestScore != 0 }
        return pastGames
    }
    
    func getPastGamesWithActiveBets() -> [Game] {
        pastGames.filter { $0.activeBetsAmount != 0 }
    }
}
