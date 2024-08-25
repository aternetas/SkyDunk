//
//  StatisticsView.swift
//  SkyDunk
//
//  Created by aternetas on 13.08.2024.
//

import UIKit
import SnapKit

class StatisticsView: UIView {
    
    private lazy var titleView: UILabel = UILabel(text: "СТАТИСТИКА", font: .light14)
    
    private lazy var separatorView: SeparatorView = SeparatorView()
    
    lazy var valuesContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 2.0
        view.distribution = .equalSpacing
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .backgroundGray
        addShadows()
        layer.cornerRadius = 10
    }
    
    func bind(vm: StatisticsVM) {
        createArrangedSubviews(vm: vm).forEach{ valuesContainer.addArrangedSubview($0) }
    }
    
    private func createArrangedSubviews(vm: StatisticsVM) -> [TitleValueView] {
        var elements: [TitleValueView] = []
        vm.allCases.forEach {
            elements.append(TitleValueView(title: $0.key.rawValue, value: $0.value, marker: $0.marker))
        }
        return elements
    }
    
    private func initConstraints() {
        addSubviews([titleView, separatorView, valuesContainer])
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.leading.equalToSuperview().offset(16)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(9)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        valuesContainer.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(14)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
}
