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
        
        rootView.pastGamesTableView.refreshControl?.addTarget(self, action: #selector(refreshPastGames), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func dismissModal() {
        viewModel.viewDidLoad()
    }
    
    @objc func refreshPastGames() {
        viewModel.refreshPastGames()
    }
}

extension PastGamesController: PastGamesModelDelegate {
    
    func updatePastGames() {
        DispatchQueue.main.async { [weak self] in
            if self?.viewModel.gamesWithActiveBetsVM.count != 0 {
                self?.rootView.activeBetsContainerHC.constant = 230
            } else {
                self?.rootView.activeBetsContainerHC.constant = 0
            }
            
            self?.rootView.setupView()
            self?.rootView.gamesWithActiveBetsCollectionView.reloadData()
            self?.rootView.pastGamesTableView.reloadData()
            self?.rootView.pastGamesTableView.refreshControl?.endRefreshing()
        }
    }
    
    func showEmptyState(isShow: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.activeBetsContainerHC.constant = 0
            self?.rootView.emptyStateView.isHidden = !isShow
        }
    }
}

extension PastGamesController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.gamesWithActiveBetsVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
        cell.bind(vm: viewModel.gamesWithActiveBetsVM[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: GameCell.WIDTH, height: GameCell.HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectGame(gameId: viewModel.gamesWithActiveBetsVM[indexPath.item].id)
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
