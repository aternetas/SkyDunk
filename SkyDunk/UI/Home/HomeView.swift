//
//  HomeView.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class HomeView: UIView {
    
    let lastGameView = LastGameView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints() {
        addSubview(lastGameView)
        lastGameView.backgroundColor = .white
        lastGameView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lastGameView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            lastGameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lastGameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lastGameView.heightAnchor.constraint(equalToConstant: 195)
        ])
        
    }
}
