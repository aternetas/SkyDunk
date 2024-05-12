//
//  GradientView.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import UIKit

class GradientView: UIView {
    
    enum GradientDirection {
        case leftToRight
        case topToBottom
    }
    
    var gradientDirection: GradientDirection = .topToBottom
    private var colors: [CGColor] = []
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    func setColors(colors: [UIColor]) {
        self.colors = colors.map { $0.cgColor }
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        
        (layer as! CAGradientLayer).colors = colors
        
        switch gradientDirection {
        case .leftToRight:
            (layer as! CAGradientLayer).startPoint = .init(x: 0, y: 0.5)
            (layer as! CAGradientLayer).endPoint = .init(x: 1, y: 0.5)
        case .topToBottom:
            (layer as! CAGradientLayer).startPoint = .init(x: 0.5, y: 0)
            (layer as! CAGradientLayer).endPoint = .init(x: 0.5, y: 1)
        }
    }
}