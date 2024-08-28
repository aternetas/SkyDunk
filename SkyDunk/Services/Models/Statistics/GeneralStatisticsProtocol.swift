//
//  GeneralStatisticsProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 28.08.2024.
//

import Foundation

protocol GeneralStatisticsProtocol {
    
    var successBetsCount: Int { get }
    var allBetsCount: Int { get }
    var winRatio: Double { get }
    var commonEarnings: Double { get }
}
