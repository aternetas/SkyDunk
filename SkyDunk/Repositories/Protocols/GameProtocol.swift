//
//  GameProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 15.07.2024.
//

import Foundation

protocol GameProtocol {
    
    var id: String { get }
    var homeTeam: String { get }
    var guestTeam: String { get }
    var date: Date { get }
    var homeScore: Int { get }
    var guestScore: Int { get }
    var activeBetsAmount: Int { get }
    var betsResult: Double? { get }
}
