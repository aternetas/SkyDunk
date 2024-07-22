//
//  RemoteGameModel.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation

struct RemoteGameModel: Codable {
    
    //currently in use
    let id: Int
    let homeTeam: HomeTeamModel
    let guestTeam: GuestTeamModel
    let date: String
    let homeScore: Int
    let guestScore: Int
    
    //currently unused
    let season: Int
    let status: String
    let period: Int
    let time: String
    let postseason: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case homeTeam = "home_team"
        case guestTeam = "visitor_team"
        case date
        case homeScore = "home_team_score"
        case guestScore = "visitor_team_score"
        
        case season
        case status
        case period
        case time
        case postseason
    }
}
