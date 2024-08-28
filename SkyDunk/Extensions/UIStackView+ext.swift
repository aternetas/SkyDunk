//
//  UIStackView+ext.swift
//  SkyDunk
//
//  Created by aternetas on 26.08.2024.
//

import UIKit

extension UIStackView {
    
    func createArrangedSubviews(_ cases: [KeyValueMarker]) {
        cases.map { TitleValueView(title: $0.key.rawValue, value: $0.value, marker: $0.marker) }
            .forEach { addArrangedSubview($0) }
    }
    
    func removeSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
