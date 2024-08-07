//
//  BetTextField.swift
//  SkyDunk
//
//  Created by aternetas on 25.05.2024.
//

import UIKit

class CustomTextField: UIView {
    
    var text: String = ""
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
            
            if textField.keyboardType != .default {
                textField.inputAccessoryView = createToolbar()
            }
        }
    }
    
    private lazy var titleLab: UILabel = {
        let label = UILabel()
        label.font = UIFont(type: .regular, size: 12)
        label.textColor = .textGray
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .regular14
        textField.textColor = .textBlack
        textField.addTarget(self, action: #selector(editTextField), for: .editingChanged)
        textField.returnKeyType = .done
        return textField
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray2
        return view
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        titleLab.text = text
        textField.delegate = self
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func editTextField() {
        text = textField.text ?? ""
    }
    
    private func initConstraints() {
        addSubviewsAndAutolayout([titleLab,
                                  textField,
                                  underlineView])
        
        NSLayoutConstraint.activate([
            titleLab.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLab.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLab.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            textField.topAnchor.constraint(equalTo: titleLab.bottomAnchor, constant: 6),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            underlineView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0),
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            underlineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
