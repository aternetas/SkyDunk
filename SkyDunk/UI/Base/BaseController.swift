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
        let vc = switch screen {
        case .lastGames:
            LastGamesController()
        }
        present(vc, animated: true)
    }
}
