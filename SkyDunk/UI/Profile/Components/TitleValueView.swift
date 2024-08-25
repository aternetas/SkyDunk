//
//  TitleValueView.swift
//  SkyDunk
//
//  Created by aternetas on 20.08.2024.
//

import UIKit
import SnapKit

class TitleValueView: UIView {
    
    private lazy var titleLabel: UILabel = UILabel(font: .light12)
    
    private lazy var valueLabel: UILabel = UILabel(font: .light12)
    
    convenience init(title: String, value: String = "") {
        self.init(frame: .zero)
        
        titleLabel.text = title
        valueLabel.text = value
        initConstraints()
    }
    
    private func initConstraints() {
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
    }
}