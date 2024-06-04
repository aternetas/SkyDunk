//
//  CustomTextField+ext.swift
//  SkyDunk
//
//  Created by aternetas on 03.06.2024.
//

import UIKit

extension CustomTextField {
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(onClickDoneButton))
        toolbar.setItems([space, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        return toolbar
    }
    
    @objc private func onClickDoneButton() {
        self.endEditing(true)
    }
}
