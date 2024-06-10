//
//  TeamType+ext.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
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
        case .other:
                .black
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
        case .other:
            UIImage(resource: .plusIcon)//TODO: добавить иконку
        }
    }
}
