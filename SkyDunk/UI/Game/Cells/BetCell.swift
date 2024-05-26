//
//  BetCell.swift
//  SkyDunk
//
//  Created by aternetas on 15.05.2024.
//

import UIKit

class BetCell: UITableViewCell {
    
    static let identifier = "BetCell"
    
    lazy private var containerView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 10
        view.gradientDirection = .leftToRight
        view.clipsToBounds = true
        return view
    }()
    
    lazy private var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addShadows()
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var descriptionLab: UILabel = {
        let label = UILabel(font: UIFont(type: .regular, size: 14), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy private var amountLab: UILabel = {
        let label = UILabel(font: UIFont(type: .regular, size: 14), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.init(1000), for: .horizontal)
        return label
    }()
    
    lazy private var dateLab: UILabel = {
        let label = UILabel(font: UIFont(type: .extraLight, size: 12), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var coefficientLab: UILabel = {
        let label = UILabel(font: UIFont(type: .extraLight, size: 12), textColor: .textDark)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
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
        topButton.backgroundColor = .backgroundGreen
        topButton.setTitleColor(.white, for: .normal)
        topButton.setTitle("+", for: .normal)
        topButton.addTarget(self, action: #selector(tapOnPlusBetSwitchView), for: .touchUpInside)
        
        let bottomButton = UIButton(type: .system)
        bottomButton.backgroundColor = .backgroundRed
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.setTitle("-", for: .normal)
        bottomButton.addTarget(self, action: #selector(tapOnMinusBetSwitchView), for: .touchUpInside)
    
        sv.addArrangedSubview(topButton)
        sv.addArrangedSubview(bottomButton)
        
        sv.axis = .vertical
        sv.spacing = 3
        sv.layer.cornerRadius = 10
        sv.clipsToBounds = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.isUserInteractionEnabled = true
        return sv
    }()
    
    private lazy var amountLabTrailingConstaint = amountLab.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
    private var vm: BetVM?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(vm: BetVM) {
        self.vm = vm
        containerView.setColors(colors: vm.teams.map { $0.color.withAlphaComponent(0.5) })
        
        descriptionLab.text = vm.description
        amountLab.text = vm.amount
        dateLab.text = vm.date
        coefficientLab.text = vm.coefficient
        
        sideView.isHidden = vm.isActive
        if let isSuccess = vm.isSuccess {
            sideView.backgroundColor = isSuccess ? .backgroundGreen : .backgroundRed
        }
        
        betSwithView.isHidden = !vm.isActive
        
        amountLabTrailingConstaint.constant = vm.isActive ? -70 : -17
    }
    
    func onClick() {
        vm?.tapOnBet()
    }
    
    @objc private func tapOnPlusBetSwitchView() {
        vm?.tapOnSuccessBet()
    }
    
    @objc private func tapOnMinusBetSwitchView() {
        vm?.tapOnFailureBet()
    }
    
    private func initConstraints() {
        contentView.addSubview(shadowView)
        contentView.addSubview(containerView)
        
        containerView.addSubview(descriptionLab)
        containerView.addSubview(amountLab)
        containerView.addSubview(dateLab)
        containerView.addSubview(coefficientLab)
        containerView.addSubview(sideView)
        containerView.addSubview(betSwithView)
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7.5),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7.5),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7.5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7.5),
            
            descriptionLab.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            descriptionLab.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            descriptionLab.trailingAnchor.constraint(equalTo: amountLab.leadingAnchor, constant: -20),
            
            amountLab.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            amountLabTrailingConstaint,
            
            dateLab.topAnchor.constraint(equalTo: descriptionLab.bottomAnchor, constant: 12),
            dateLab.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            dateLab.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            coefficientLab.trailingAnchor.constraint(equalTo: amountLab.trailingAnchor),
            coefficientLab.centerYAnchor.constraint(equalTo: dateLab.centerYAnchor),
            
            sideView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            sideView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            sideView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            sideView.widthAnchor.constraint(equalToConstant: 12),
            
            betSwithView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            betSwithView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            betSwithView.heightAnchor.constraint(equalToConstant: 51),
            betSwithView.widthAnchor.constraint(equalToConstant: 51)
        ])
    }
}
