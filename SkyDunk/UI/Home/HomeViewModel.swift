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
    private var games: [Game] = []
    
    func viewDidLoad() {
        getLastGame()
        getGames()
    }
    
    func selectGame(id: String) {
        let game = games.first(where: { $0.id == id } )
        if let game = game {
            navigationManager?.openScreen(screen: .game(game: game))
        }
    }
    
    private func getGames() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            self?.games = [
                Game(homeTeam: .bostonCeltics, guestTeam: .atlantaHawks, gameDate: Date(), homeScore: 0, guestScore: 0),
                Game(homeTeam: .denverNuggets, guestTeam: .bostonCeltics, gameDate: Date(), homeScore: 0, guestScore: 0),
                Game(homeTeam: .dallasMavericks, guestTeam: .atlantaHawks, gameDate: Date(), homeScore: 0, guestScore: 0),
                Game(homeTeam: .bostonCeltics, guestTeam: .dallasMavericks, gameDate: Date(), homeScore: 0, guestScore: 0),
                Game(homeTeam: .denverNuggets, guestTeam: .atlantaHawks, gameDate: Date(), homeScore: 0, guestScore: 0),
            ]
            self?.getNextGames()
        })
    }
    
    private func getLastGame() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.delegate?.updateLastGame(vm: LastGameVM(homeTeam: "LAL", guestTeam: "BOS", homeTeamScore: 101, guestTeamScore: 116, date: Date()))
        })
    }
    
    private func getNextGames() {
        nextGames = games.map { GameVM(game: $0) }
        delegate?.updateNextGames()
    }
}
