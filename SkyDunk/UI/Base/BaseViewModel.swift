//
//  BaseViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import Foundation

protocol NavigationManagerProtocol {
    func openScreen(screen: ScreenType)
}

protocol AlertManagerProtocol {
    func showAlert(model: AlertModel)
}

class BaseViewModel {
    
    var navigationManager: NavigationManagerProtocol?
    var alertManager: AlertManagerProtocol?
    
    func showAlert(model: AlertModel) {
        alertManager?.showAlert(model: model)
    }
}
