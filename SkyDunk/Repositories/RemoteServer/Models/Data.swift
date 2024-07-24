//
//  Data.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation

struct Data: Codable {
    
    let games: [RemoteGameModel]
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case games = "data"
        case meta
    }
}

//curently unused
struct Meta: Codable {
    
    let perPage: Int
    let nextCursor: Int?
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case nextCursor = "next_cursor"
    }
}
