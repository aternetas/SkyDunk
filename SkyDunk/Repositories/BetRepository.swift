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
}