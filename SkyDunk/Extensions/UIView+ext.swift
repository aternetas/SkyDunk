//
//  UIView+ext.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

extension UIView {
    
    func addShadows(
        color: UIColor = UIColor.black,
        radius: CGFloat = 5.0,
        opacity: Float = 0.2,
        offset: CGSize = CGSize(width: 0, height: 4)
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
    }
}
