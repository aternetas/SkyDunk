//
//  BetService.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetService {
    
    private let repository: LocalBetRepositoryProtocol
    
    init(repository: LocalBetRepositoryProtocol) {
        self.repository = repository
    }
    
    func getBets(completion: @escaping([Bet]) -> ()) throws {
        completion(try repository.getBets().map { Bet(dto: $0) })
    }
    
    func getActiveBets(completion: @escaping([Bet]) -> ()) throws {
        completion(try repository.getBets().filter { $0.isSuccess == nil }.map { Bet(dto: $0) })
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping([Bet]) -> ()) throws {
        completion(try repository.getBetsByGameId(gameId).map { Bet(dto: $0) })
    }
    
    func editBet(id: String, isSuccess: Bool, completion: @escaping () -> ()) {
//        if try repository.editBet(id: id, isSuccess: isSuccess) {
//            completion()
//        }
    }
    
    func addBet(description: String, amount: Double, coefficient: Double, betOn: [String], gameId: String, completion: @escaping (Result<Bool, Error>) -> ()) {
        do {
            try repository.addBet(description: description, amount: amount, coefficient: coefficient, betOn: betOn, gameId: gameId)
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }
}
