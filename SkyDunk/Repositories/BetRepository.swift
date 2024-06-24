//
//  BetRepository.swift
//  SkyDunk
//
//  Created by aternetas on 19.06.2024.
//

import Foundation

class BetRepository {
    
    func getBets(completion: @escaping([BetDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            completion(tmpBets)
        })
    }
    
    func getBetsByGameId(_ gameId: String, completion: @escaping([BetDTO]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            completion(tmpBets.filter { $0.gameId == gameId })
        })
    }
    
    func editBet(id: String, description: String? = nil, isSuccess: Bool? = nil, completion: @escaping((BetDTO, Int) -> ())) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.3, execute: { [weak self] in
            let dto = self?.findBetById(id: id)
            let index = tmpBets.firstIndex(where: { $0.id == id })
            
            if let dto = dto, let index = index {
                let editDto = BetDTO(id: id,
                                     gameId: dto.gameId,
                                     description: description ?? dto.description,
                                     betCreated: dto.betCreated,
                                     amount: dto.amount,
                                     coefficient: dto.coefficient,
                                     betOn: dto.betOn,
                                     isSuccess: isSuccess ?? dto.isSuccess)
                tmpBets[index] = editDto
                completion(editDto, index)
            }
        })
    }
    
    private func findBetById(id: String) -> BetDTO? {
        tmpBets.first(where: { $0.id == id } )
    }
}
