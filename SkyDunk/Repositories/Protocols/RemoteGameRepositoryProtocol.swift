//
//  RemoteGameRepositoryProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 25.07.2024.
//

import Foundation

protocol RemoteGameRepositoryProtocol {
    
    func getGames(completion: @escaping ([GameProtocol]) -> ())
}
