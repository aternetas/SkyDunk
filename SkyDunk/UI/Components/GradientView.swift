//
//  GradientView.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import UIKit

class GradientView: UIView {

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
        (layer as! CAGradientLayer).locations = [0.0, 1.0]
    }
}
