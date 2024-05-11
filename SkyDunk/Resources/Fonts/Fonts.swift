//
//  Fonts.swift
//  SkyDunk
//
//  Created by Nebo on 11.05.2024.
//

import UIKit

extension UIFont {
    
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
