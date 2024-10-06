//
//  GameService.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

class GameService: MyLogger {
    
    private let remoteRepository: RemoteGameRepositoryProtocol
    private let localRepository: LocalGameRepositoryProtocol
    private var games: [Game] = []
    
    init(remoteRepository: RemoteGameRepositoryProtocol, localRepository: LocalGameRepositoryProtocol) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func getGames(lastUpdation: String, completion: @escaping (Result<[Game], Error>) -> ()) {
        remoteRepository.getGames(lastUpdation: lastUpdation) { [weak self] res in
            switch res {
            case .success(let dtos):
                do {
                    try self?.localRepository.updateGames(games: dtos)
                    if let games = try self?.localRepository.getGames() {
                        self?.games = games.map { Game(dto: $0) }
                        completion(.success(self?.games ?? []))
                    }
                } catch {
                    self?.logError(error.localizedDescription, funcName: #function)
                    completion(.failure(Errors.RealmError.cantUpdateObject))
                }
                
            case .failure(let error):
                self?.logError(error.localizedDescription, funcName: #function)
                completion(.failure(Errors.RealmError.cantGetObjs))
            }
        }
    }
    
    func getGameByGameId(_ gameId: String) -> Game? {
        games.first(where: { $0.id == gameId })
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
