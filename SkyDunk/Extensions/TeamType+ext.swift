//
//  TeamType+ext.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import UIKit

extension TeamType {
    
    var color: UIColor {
        switch self {
        case .bostonCeltics:
            UIColor(resource: .bostonCeltics)
        case .denverNuggets:
            UIColor(resource: .denverNuggets)
        case .atlantaHawks:
            UIColor(resource: .atlantaHawks)
        case .dallasMavericks:
            UIColor(resource: .dallasMavericks)
        }
    }
    
    var logo: UIImage {
        switch self {
        case .bostonCeltics:
            UIImage(resource: .BOS)
        case .denverNuggets:
            UIImage(resource: .DEN)
        case .atlantaHawks:
            UIImage(resource: .ATL)
        case .dallasMavericks:
            UIImage(resource: .DAL)
        }
    }
}
