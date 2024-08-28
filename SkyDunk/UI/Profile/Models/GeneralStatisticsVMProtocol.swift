//
//  GeneralStatisticsVMProtocol.swift
//  SkyDunk
//
//  Created by aternetas on 28.08.2024.
//

import Foundation

protocol GeneralStatisticsVMProtocol {
    
    var allCases: [KeyValueMarker] { get }

    var successBetsAmount: KeyValueMarker { get }
    var allBetsCount: KeyValueMarker { get }
    var winningPercent: KeyValueMarker { get }
    var commonEarnings: KeyValueMarker { get }
}
