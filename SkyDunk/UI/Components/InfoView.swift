//
//  InfoView.swift
//  SkyDunk
//
//  Created by Nebo on 18.05.2024.
//

import UIKit

class InfoView: UIView {
    
    private lazy var infoLab: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(type: .light, size: 14)
        label.textColor = .textDark
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        infoLab.text = text
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(text: String) {
        infoLab.text = text
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        layer.cornerRadius = 10
        addShadows()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initConstraints() {
        addSubview(infoLab)
        
        NSLayoutConstraint.activate([
            infoLab.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            infoLab.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            infoLab.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            infoLab.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
