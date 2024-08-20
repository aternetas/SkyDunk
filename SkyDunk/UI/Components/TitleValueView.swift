//
//  TitleValueView.swift
//  SkyDunk
//
//  Created by aternetas on 20.08.2024.
//

import Foundation
import UIKit
import SnapKit

class TitleValueView: UIView {
    
    private lazy var titleLabel: UILabel = UILabel(font: .light12)
    
    private lazy var valueLabel: UILabel = UILabel(font: .light12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    convenience init(title: String, value: String) {
        self.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        valueLabel.text = value
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
