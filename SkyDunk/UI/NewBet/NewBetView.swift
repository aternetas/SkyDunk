//
//  NewBetView.swift
//  SkyDunk
//
//  Created by aternetas on 19.05.2024.
//

import UIKit

class NewBetView: UIView {
    
    
    lazy var newBetLab: UILabel = {
        let label = UILabel(text: "Новая ставка", font: UIFont(type: .medium, size: 20), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .backgroundWhite
        initConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstaints() {
        addSubview(newBetLab)
        
        NSLayoutConstraint.activate([
            newBetLab.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            newBetLab.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
