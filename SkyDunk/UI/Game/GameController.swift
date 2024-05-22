//
//  GameController.swift
//  SkyDunk
//
//  Created by aternetas on 12.05.2024.
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
        
        rootView.newBetButton.addTarget(self, action: #selector(clickOnNewBetButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    @objc private func clickOnNewBetButton() {
        viewModel.addNewBet()
    }
}

extension GameController: GameViewModelDelegat {
    
    func showGame(game: GameHeaderVM) {
        rootView.gameHeaderView.bind(vm: game)
    }
    
    func showBets() {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.betsTableView.reloadData()
        }
    }
    
    func updateBet(index: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.betsTableView.reloadRows(at: [.init(row: index, section: 0)], with: .automatic)
        }
    }
    
    func showEmptyState(isShow: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.betsTableView.isHidden = isShow
            self?.rootView.emptyStateView.isHidden = !isShow
        }
    }
}

extension GameController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.betsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BetCell.identifier, for: indexPath) as! BetCell
        cell.backgroundColor = .white
        cell.bind(vm: viewModel.betsVM[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as? BetCell)?.onClick()
    }
}
