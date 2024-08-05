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
    
    func getGames(completion: @escaping (Result<[Game], Error>) -> ()) {
        remoteRepository.getGames { [weak self] res in
            switch res {
                
            case .success(let dtos):
                self?.localRepository.updateGames(games: dtos)
                do {
                    if let games = try self?.localRepository.getGames() {
                        self?.games = games.map { Game(dto: $0) }
                        completion(.success(self?.games ?? []))
                    }
                } catch {
                    completion(.failure(Errors.RealmError.cantGetObjs(Game.self)))
                }
                
            case .failure(_):
                completion(.failure(Errors.RealmError.cantGetObjs(Game.self)))
            }
        }
    }
    
    func getGameByGameId(_ gameId: String, completion: @escaping (Result<Game, Error>) -> ()) {
        do {
            guard let dto = try localRepository.getGames().first(where: { $0.id == gameId }) else { completion(.failure(Errors.RealmError.cantGetObjs(GameProtocol.self)))
                return
            }
            completion(.success(Game(dto: dto)))
        } catch {
            completion(.failure(error))
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
    
    private func updateGames(games: [GameProtocol]) {
        localRepository.updateGames(games: games)
    }
}
