//
//  UIView+ext.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

extension UIView {
    
    func addShadows(
        color: UIColor = UIColor.black,
        radius: CGFloat = 4.0,
        opacity: Float = 0.25,
        offset: CGSize = CGSize(width: 0, height: 4)) {
            layer.shadowColor = color.cgColor
            layer.shadowRadius = radius
            layer.shadowOpacity = opacity
            layer.shadowOffset = offset
        }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    func addSubviewsAndAutolayout(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
