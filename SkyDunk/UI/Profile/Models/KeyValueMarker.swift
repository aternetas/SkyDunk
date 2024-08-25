//
//  KeyValueMarker.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import Foundation

enum Marker {
    case basic, win, defeat
}

struct KeyValueMarker {
    
    let key: StatisticsTitle
    let value: String
    let marker: Marker
}
