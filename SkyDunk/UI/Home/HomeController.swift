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
