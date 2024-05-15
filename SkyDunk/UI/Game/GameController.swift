//
//  GameController.swift
//  SkyDunk
//
//  Created by f f on 12.05.2024.
//

import UIKit

class GameController: BaseController<GameViewModel> {
    
    let rootView = GameView()
    
    override init() {
        super.init()
        viewModel = GameViewModel()
        viewModel.delegate = self
        
        rootView.betsTableView.delegate = self
        rootView.betsTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
}

extension GameController: GameViewModelDelegat {
    func showGame(game: GameHeaderVM) {
        rootView.gameHeaderView.bind(vm: game)
    }
}

extension GameController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BetCell.identifier, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
