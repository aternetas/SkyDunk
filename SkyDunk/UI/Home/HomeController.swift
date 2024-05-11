//
//  HomeController.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

class HomeController: UIViewController {
    
    private let viewModel = HomeViewModel()//just temporary
    private let rootView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getLastGame()
        
        rootView.nextGamesCollectionView.delegate = self
        rootView.nextGamesCollectionView.dataSource = self
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
}

extension HomeController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 140, height: GameCell.HEIGHT)
    }
}
