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
        case .pastGames:
            viewController = PastGamesController()
        case .game(gameId: let gameId):
            let vc = GameController()
            vc.viewModel.setGame(gameId: gameId)
            viewController = vc
        case .newBet(gameId: let gameId):
            let vc = NewBetController()
            vc.viewModel.setGame(gameId: gameId)
            viewController = vc
        }
        
        viewController.presentationController?.delegate = self
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

extension UIViewController: UIAdaptivePresentationControllerDelegate {
    
    @objc func dismissModal() {}
    
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        dismissModal()
    }
}
