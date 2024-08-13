//
//  ProfileView.swift
//  SkyDunk
//
//  Created by aternetas on 12.08.2024.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {
    
    private lazy var scrollView: UIScrollView = UIScrollView()

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20.0
        view.distribution = .fillEqually
        [balanceView, InfoView(text: "Мои ставки"), InfoView(text: "Что-то ещё")].forEach { view.addArrangedSubview($0) }
        return view
    }()
    
    private lazy var balanceView: BalanceView = {
        let view = BalanceView()
        view.backgroundColor = .backgroundGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .backgroundWhite
        initConstraints()
        tmp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tmp() {
//        scrollView.backgroundColor = .gray.withAlphaComponent(0.15)
        stackView.backgroundColor = .yellow.withAlphaComponent(0.1)
    }
    
    private func initConstraints() {
        addSubview(scrollView)
        addSubview(stackView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(82)
            make.height.equalTo(100)
            make.leading.equalTo(scrollView).offset(20)
            make.trailing.equalTo(scrollView).offset(-20)
        }
    }
}
