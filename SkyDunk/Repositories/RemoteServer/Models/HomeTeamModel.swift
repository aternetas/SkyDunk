//
//  HomeTeamModel.swift
//  SkyDunk
//
//  Created by aternetas on 22.07.2024.
//

import Foundation

struct HomeTeamModel: Codable {
    
    //currently in use
    let id: Int
    let fullName: String
    let abbreviation: String
    
    //curently unused
    let conference: String
    let division: String
    let city: String
    let name: String
}
