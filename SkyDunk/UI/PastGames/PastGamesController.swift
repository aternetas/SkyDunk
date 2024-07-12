//
//  LastGamesController.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class PastGamesController: BaseController<PastGamesViewModel> {
    
    private let rootView = PastGamesView()

    override init() {
        super.init()
        viewModel = PastGamesViewModel()
        
        rootView.pastGamesTableView.delegate = self
        rootView.pastGamesTableView.dataSource = self
        
        rootView.gamesWithActiveBetsCollectionView.delegate = self
        rootView.gamesWithActiveBetsCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getGames()
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func dismissModal() {
        viewModel.getGames()
    }
}

extension PastGamesController: PastGamesModelDelegate {
    
    func updatePastGames() {
        DispatchQueue.main.async { [weak self] in
            if self?.viewModel.gamesWithActiveBets.count == 0 {
                self?.rootView.activeBetsContainerViewHeight.constant = 0
            }
            
            self?.rootView.gamesWithActiveBetsCollectionView.reloadData()
            self?.rootView.pastGamesTableView.reloadData()
        }
    }
    
    func showEmptyState(isShow: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.activeBetsContainerViewHeight.constant = 0
            self?.rootView.emptyStateView.isHidden = !isShow
        }
    }
}

extension PastGamesController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.gamesWithActiveBets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
        cell.bind(vm: viewModel.gamesWithActiveBets[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: GameCell.WIDTH, height: GameCell.HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectGame(gameId: viewModel.gamesWithActiveBets[indexPath.item].id)
    }
}

extension PastGamesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pastGamesVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PastGameCell.identifier, for: indexPath) as! PastGameCell
        cell.bind(vm: viewModel.pastGamesVM[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as? PastGameCell)?.onClick()
    }
}

extension PastGamesController: PastGameCellListenerProtocol {
    
    func selectGame(gameId: String) {
        viewModel.selectGame(gameId: gameId)
    }
}
