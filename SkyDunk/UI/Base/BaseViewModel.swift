//
//  BaseViewModel.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import Foundation

protocol NavigationManagerProtocol {
    func openScreen(screen: ScreenType)
}

class BaseViewModel {
    
    var navigationManager: NavigationManagerProtocol?
}
