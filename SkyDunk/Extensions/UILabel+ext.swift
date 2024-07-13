//
//  UILabel+ext.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = " ", font: UIFont, textColor: UIColor = .textBlack) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
