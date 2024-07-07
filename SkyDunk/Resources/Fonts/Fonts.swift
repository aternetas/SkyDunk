//
//  Fonts.swift
//  SkyDunk
//
//  Created by Nebo on 11.05.2024.
//

import UIKit

extension UIFont {
    
    static var extraLight12 = UIFont(type: .extraLight, size: 12)
    static var extraLight15 = UIFont(type: .extraLight, size: 15)
    
    static var light14 = UIFont(type: .light, size: 14)
    static var light18 = UIFont(type: .light, size: 18)
    
    static var regular14 = UIFont(type: .regular, size: 14)
    
    static var medium20 = UIFont(type: .medium, size: 20)

    enum MyFont {
        case extraLight, light, medium, regular
        
        var name: String {
            switch self {
            case .extraLight:
                "Inter-ExtraLight"
            case .light:
                "Inter-Light"
            case .medium:
                "Inter-Medium"
            case .regular:
                "Inter-Regular"
            }
        }
    }
    
    convenience init(type: MyFont, size: CGFloat) {
        self.init(name: type.name, size: size)!
    }
}
