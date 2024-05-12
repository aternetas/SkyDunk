//
//  GameView.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import UIKit

class GameView: UIView {
    
    lazy var gameHeaderView = {
        let view = GameHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundWhite
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints() {
        addSubview(gameHeaderView)
        
        NSLayoutConstraint.activate([
            gameHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            gameHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            gameHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            gameHeaderView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
}
