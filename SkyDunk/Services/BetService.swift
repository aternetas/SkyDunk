//
//  BetService.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetService: MyLogger {
    
    private let repository: LocalBetRepositoryProtocol
    
    init(repository: LocalBetRepositoryProtocol) {
        self.repository = repository
    }
    
    func getBets(completion: @escaping(Result<[Bet], Error>) -> ()) {
        do {
            completion(.success(try repository.getBets().map { Bet(dto: $0) }))
        } catch {
            logError(error.localizedDescription, funcName: #function)
            completion(.failure(Errors.RealmError.cantGetObjs))
        }
    }
    
    func getActiveBets(completion: @escaping(Result<[Bet], Error>) -> ()) {
        do {
            completion(.success(try repository.getBets().filter { $0.isSuccess == nil }.map { Bet(dto: $0) }))
        } catch {
            logError(error.localizedDescription, funcName: #function)
            completion(.failure(Errors.RealmError.cantGetObjs))
        }
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping(Result<[Bet], Error>) -> ()) {
        do {
            completion(.success(try repository.getBetsByGameId(gameId).map { Bet(dto: $0) }))
        } catch {
            logError(error.localizedDescription, funcName: #function)
            completion(.failure(Errors.RealmError.cantGetObjs))
        }
    }
    
    func editBet(id: String, isSuccess: Bool, completion: @escaping (Result<Void, Error>) -> ()) {
        do {
            completion(.success(try repository.editBet(id: id, isSuccess: isSuccess)))
        } catch {
            logError(error.localizedDescription, funcName: #function)
            completion(.failure(Errors.RealmError.cantUpdateObject))
        }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping (Result<Void, Error>) -> ()) {
        do {
            try completion(.success(repository.addBet(description: description, amount: amount, coefficient: coefficient, betOn: betOn, gameId: gameId)))
        } catch {
            logError(error.localizedDescription, funcName: #function)
            completion(.failure(Errors.RealmError.cantAddObject))
        }
    }
}
