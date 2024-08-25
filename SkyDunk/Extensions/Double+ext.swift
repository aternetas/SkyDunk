//
//  Double+ext.swift
//  SkyDunk
//
//  Created by aternetas on 25.08.2024.
//

import Foundation

extension Double {
    
    func toPercent() -> String {
        "\(self.round())%"
    }
    
    func toPercentMarker() -> Marker {
        self > 50 ? .win : .defeat
    }
    
    func toString() -> String {
        (self > 0 ? "+" : "").appending("\(self.round())")
    }
    
    func toMarker() -> Marker {
        self > 0 ? .win : .defeat
    }
    
    private func round() -> Int {
        Int(self.rounded(.towardZero))
    }
}
