//
//  BaseController.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import UIKit

class BaseController<VM: BaseViewModel>: UIViewController {
    
    var viewModel: VM!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.navigationManager = self
        viewModel.alertManager = self
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
        case .newBet(game: let game):
            let vc = NewBetController()
            vc.viewModel.setGame(game: game)
            viewController = vc
        }
        present(viewController, animated: true)
    }
}

extension BaseController: AlertManagerProtocol {
    
    func showAlert(model: AlertModel) {
        
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        
        model.actions.forEach { alertActionModel in
            alert.addAction(UIAlertAction(title: alertActionModel.title, style: .default, handler: { _ in
                alertActionModel.action()
            }))
        }
        present(alert, animated: true)
    }
}
