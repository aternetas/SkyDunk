//
//  BaseViewModel.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import Foundation

enum ScreenType {
    case lastGames
}

protocol NavigationManagerProtocol {
    func openScreen(screen: ScreenType)
}

class BaseViewModel {
    var navigationManager: NavigationManagerProtocol?
}
