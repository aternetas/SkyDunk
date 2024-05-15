//
//  BetCell.swift
//  SkyDunk
//
//  Created by f f on 15.05.2024.
//

import UIKit

class BetCell: UITableViewCell {
    
    static let identifier = "BetCell"
//    static let HEIGHT: CGFloat = 40
    
    lazy private var containerView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.gradientDirection = .leftToRight
        view.clipsToBounds = true
        return view
    }()
    
    lazy private var descriptionLab: UILabel = {
        let label = UILabel(font: UIFont(type: .light, size: 15), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var amountLab: UILabel = {
        let label = UILabel(font: UIFont(type: .light, size: 15), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var dateLab: UILabel = {
        let label = UILabel(font: UIFont(type: .extraLight, size: 11), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var coefficientLab: UILabel = {
        let label = UILabel(font: UIFont(type: .extraLight, size: 11), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var sideView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var betSwithView: UIStackView = {
        let sv = UIStackView()
        
        let topButton = UIButton(type: .system)
        topButton.backgroundColor = .green
        topButton.setTitleColor(.white, for: .normal)
        topButton.setTitle("+", for: .normal)
        
        let bottomButton = UIButton(type: .system)
        bottomButton.backgroundColor = .red
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.setTitle("-", for: .normal)
        
        sv.addArrangedSubview(topButton)
        sv.addArrangedSubview(bottomButton)
        
        sv.axis = .vertical
        sv.spacing = 3
        sv.layer.cornerRadius = 10
        sv.clipsToBounds = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: BetVM) {
        
    }
    
//    private func setupView() {
//        addShadows()
//    }
    
    private func initConstraints() {
        contentView.addSubview(containerView)
        
        containerView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        containerView.setColors(colors: [.green, .green])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7.5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7.5),
        
        ])
    }
}
