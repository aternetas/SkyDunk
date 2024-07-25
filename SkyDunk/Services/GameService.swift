//
//  GameService.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameService {
    
    private let remoteRepository: GameRepositoryProtocol
    private let localRepository: GameRepositoryProtocol
    private var games: [Game] = []
    
    init(remoteRepository: GameRepositoryProtocol, localRepository: GameRepositoryProtocol) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func getGames(completion: @escaping ([Game]) -> ()) {
        remoteRepository.getGames { [weak self] dtos in
            self?.games = dtos.map { Game(dto: $0) }
            completion(self?.games ?? [])
        }
    }
    
    func getGameByGameId(_ gameId: String, completion: @escaping (Game?) -> ()) {
        remoteRepository.getGames { dtos in
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
        games.filter { Date.now > $0.date }
            .sorted { $0.date > $1.date }
    }
}
