//
//  GameService.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameService {
    
    private let remoteRepository: RemoteGameRepositoryProtocol
    private let localRepository: LocalGameRepositoryProtocol
    private var games: [Game] = []
    
    init(remoteRepository: RemoteGameRepositoryProtocol, localRepository: LocalGameRepositoryProtocol) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func getGames(completion: @escaping ([Game]) -> ()) {
        weak var _self = self
        remoteRepository.getGames { dtos in
            _self?.updateGames(games: dtos) { res in
                if res == true {
                    _self?.localRepository.getGames { games in
                        _self?.games = games.map { Game(dto: $0) }
                        completion(_self?.games ?? [])
                    }
                }
            }
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
    
    private func updateGames(games: [GameProtocol], completion: @escaping (Bool) -> ()) {
        localRepository.updateGames(games: games) { completion(true) }
    }
}
