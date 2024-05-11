//
//  GameCell.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    static let identifier = "GameCell"
    static let HEIGHT: CGFloat = 172
    
    lazy private var containerView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(resource: .backgroundGray)
        view.layer.cornerRadius = 10
        addShadows()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints() {
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
