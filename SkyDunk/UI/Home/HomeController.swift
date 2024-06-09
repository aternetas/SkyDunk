//
//  HomeController.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import UIKit

class HomeController: BaseController<HomeViewModel> {
    
    private let rootView = HomeView()

    override init() {
        super.init()
        viewModel = HomeViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self

        rootView.nextGamesCollectionView.delegate = self
        rootView.nextGamesCollectionView.dataSource = self
        
        rootView.betsTableView.delegate = self
        rootView.betsTableView.dataSource = self
        
        viewModel.viewDidLoad()
        
        let lastGameViewTap = UITapGestureRecognizer(target: self, action: #selector(tapOnLastGameView))
        rootView.lastGameView.addGestureRecognizer(lastGameViewTap)
    }

    @objc private func tapOnLastGameView() {
        if let lastGameId = viewModel.lastGameVM?.id {
            viewModel.selectGame(id: lastGameId)
        }
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        rootView.betsTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        rootView.betsTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newValue = change?[.newKey] {
                let newSize = newValue as! CGSize
                rootView.betsTableViewHeight.constant = (newValue as! CGSize).height
            }
        }
    }
}

extension HomeController: HomeViewModelDelegat {
    
    func updateLastGame(vm: LastGameVM) {
        rootView.lastGameView.bind(vm: vm)
    }
    
    func updateNextGames() {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.nextGamesCollectionView.reloadData()
        }
    }
    
    func updateActiveBets() {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.activeBetsLabel.isHidden = self?.viewModel.activeBetsVM.count != 0 ? false : true
            self?.rootView.betsTableView.reloadData()
        }
    }
    
    func updateActiveBet(index: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.rootView.betsTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.nextGamesVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
        cell.bind(vm: viewModel.nextGamesVM[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 140, height: GameCell.HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = viewModel.nextGamesVM[indexPath.item]
        viewModel.selectGame(id: game.id)
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.activeBetsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BetCell.identifier, for: indexPath) as! BetCell
        cell.bind(vm: viewModel.activeBetsVM[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as? BetCell)?.onClick()
    }
}
