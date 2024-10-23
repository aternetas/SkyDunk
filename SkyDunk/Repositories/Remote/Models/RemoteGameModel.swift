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
    let date: String
    let homeTeam: TeamModel
    let guestTeam: TeamModel
    let homeScore: Int
    let guestScore: Int
    
    //currently unused
    let season: Int
    let status: String
    let period: Int
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
        case postseason
    }
}
