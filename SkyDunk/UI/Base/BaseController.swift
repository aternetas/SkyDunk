//
//  BaseController.swift
//  SkyDunk
//
//  Created by f f on 11.05.2024.
//

import UIKit

class BaseController<VM: BaseViewModel>: UIViewController {
    
    var viewModel: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.navigationManager = self
    }
}

extension BaseController: NavigationManagerProtocol {
    func openScreen(screen: ScreenType) {
        let viewController: UIViewController
        
        switch screen {
        case .lastGames:
            viewController = LastGamesController()
        case .game(game: let game):
            let vc = GameController()
            vc.viewModel.setGame(game: game)
            viewController = vc
        }
        present(viewController, animated: true)
    }
}
