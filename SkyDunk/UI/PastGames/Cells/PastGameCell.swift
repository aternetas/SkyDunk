//
//  PastGameCell.swift
//  SkyDunk
//
//  Created by aternetas on 06.07.2024.
//

import UIKit

class PastGameCell: UITableViewCell {
    
    static let identifier = "PastGameCell"
    static let HEIGHT: CGFloat = 88
    
    lazy private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints() {
        contentView.addSubviewsAndAutolayout([containerView])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.heightAnchor.constraint(equalToConstant: PastGameCell.HEIGHT)
        ])
    }
}
