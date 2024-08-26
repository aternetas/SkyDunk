//
//  UIStackView+ext.swift
//  SkyDunk
//
//  Created by aternetas on 26.08.2024.
//

import UIKit

extension UIStackView {
    
    func createArrangedSubviews(vm: StatisticsVM) -> [TitleValueView] {
        var elements: [TitleValueView] = []
        vm.allCases.forEach {
            elements.append(TitleValueView(title: $0.key.rawValue, value: $0.value, marker: $0.marker))
        }
        return elements
    }
    
    func removeSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
