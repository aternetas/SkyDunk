//
//  HomeView.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class HomeView: UIView {
    
    lazy var lastGameView = {
        let view = LastGameView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var nextGameLabel = {
        let label = UILabel(text: "БЛИЖАЙШИЕ ИГРЫ",
                font: UIFont(type: .light, size: 18),
                textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundWhite
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints() {
        addSubview(lastGameView)
        addSubview(nextGameLabel)
        
        NSLayoutConstraint.activate([
            lastGameView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            lastGameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lastGameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lastGameView.heightAnchor.constraint(equalToConstant: 157),
            
            nextGameLabel.topAnchor.constraint(equalTo: lastGameView.bottomAnchor, constant: 40),
            nextGameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
