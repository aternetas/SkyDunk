//
//  HomeViewModel.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import Foundation

protocol HomeViewModelDelegat {
    func updateLastGame(vm: LastGameVM)
    func updateNextGames()
}

class HomeViewModel: BaseViewModel {
    var delegate: HomeViewModelDelegat?
    var nextGames: [GameVM] = []
    
    func viewDidLoad() {
        getLastGame()
        getNextGames()
    }
    
    func selectGame(index: Int) {
        let game = nextGames[index]
        navigationManager?.openScreen(screen: .lastGames)
    }
    
    private func getLastGame() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.delegate?.updateLastGame(vm: LastGameVM(homeTeam: "LAL", guestTeam: "BOS", homeTeamScore: 101, guestTeamScore: 116, date: Date()))
        })
    }
    
    private func getNextGames() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            self?.nextGames = [
                GameVM(homeTeam: .bostonCeltics, guestTeam: .dallasMavericks, gameDate: Date()),
                GameVM(homeTeam: .atlantaHawks, guestTeam: .dallasMavericks, gameDate: Date()),
                GameVM(homeTeam: .atlantaHawks, guestTeam: .dallasMavericks, gameDate: Date()),
                GameVM(homeTeam: .atlantaHawks, guestTeam: .dallasMavericks, gameDate: Date()),
                GameVM(homeTeam: .denverNuggets, guestTeam: .dallasMavericks, gameDate: Date())
            ]
            self?.delegate?.updateNextGames()
        })
    }
}
