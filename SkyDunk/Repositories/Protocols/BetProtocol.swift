//
//  BetProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 16.07.2024.
//

import Foundation

protocol BetProtocol {
    
    var id: String { get }
    var gameId: String { get }
    var betDescription: String { get }
    var created: Date { get }
    var amount: Double { get }
    var coefficient: Double { get }
    var betOn: [String] { get }
    var isSuccess: Bool? { get }
}
