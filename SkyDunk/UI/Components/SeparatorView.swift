//
//  SeparatorView.swift
//  SkyDunk
//
//  Created by aternetas on 20.08.2024.
//

import Foundation
import UIKit

class SeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .backgroundGray3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
