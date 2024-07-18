//
//  BaseViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

protocol NavigationManagerProtocol: AnyObject {
    func openScreen(screen: ScreenType)
}

protocol AlertManagerProtocol: AnyObject {
    func showAlert(model: AlertModel)
}

class BaseViewModel {
    
    weak var navigationManager: NavigationManagerProtocol?
    weak var alertManager: AlertManagerProtocol?
    
    func showAlert(model: AlertModel) {
        alertManager?.showAlert(model: model)
    }
}
