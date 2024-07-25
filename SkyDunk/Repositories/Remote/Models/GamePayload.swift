//
//  GamePayload.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation

struct GamePayload: Codable {
    
    let games: [RemoteGameModel]
    let meta: gameMetaData

    enum CodingKeys: String, CodingKey {
        case games = "data"
        case meta
    }
}

//curently unused
struct gameMetaData: Codable {
    
    let perPage: Int
    let nextCursor: Int?
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case nextCursor = "next_cursor"
    }
}
