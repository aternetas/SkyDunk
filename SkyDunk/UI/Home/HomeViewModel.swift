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
    var nextGamesVM: [GameVM] = []
    var lastGameVM: LastGameVM? = nil
    private var games: [Game] = []
    
    func viewDidLoad() {
        getGames()
    }
    
    func selectGame(id: String) {
        let game = games.first(where: { $0.id == id } )
        if let game = game {
            navigationManager?.openScreen(screen: .game(game: game))
        }
    }
    
    private func getGames() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            self?.games = [
                Game(homeTeam: .bostonCeltics, guestTeam: .atlantaHawks, gameDate: Date(), homeScore: 0, guestScore: 0, bets: [Bet(description: "fias satao fit xiiu aiobx oteswy te qotn ydcn innie3 tktk", date: Date(), amount: 10, coefficient: 2, teams: [TeamType.bostonCeltics], isSuccess: nil)]),
                Game(homeTeam: .denverNuggets, guestTeam: .bostonCeltics, gameDate: Date(), homeScore: 0, guestScore: 0, bets: [Bet(description: "tr aeiny renit aosi snnt ycce 2 teet naie;yyy xenaieoi ynyrnynuyw sn ain ir iw aytyty", date: Date(), amount: 200, coefficient: 1.4, teams: [TeamType.denverNuggets, TeamType.bostonCeltics], isSuccess: true)]),
                Game(homeTeam: .dallasMavericks, guestTeam: .atlantaHawks, gameDate: Date(), homeScore: 0, guestScore: 0, bets: [Bet(description: "tr aeiny renit aosi snnt ycce 2 teet naie;yyy xenaieoi ynyrnynuyw sn ain ir iw aytyty", date: Date(), amount: 200, coefficient: 1.4, teams: [TeamType.denverNuggets, TeamType.bostonCeltics], isSuccess: true), Bet(description: "ta 2 aie cyyc ainni xeinintya ntein xieni", date: Date(), amount: 45.5, coefficient: 3.21, teams: [TeamType.dallasMavericks], isSuccess: false)]),
                Game(homeTeam: .bostonCeltics, guestTeam: .dallasMavericks, gameDate: Date(), homeScore: 0, guestScore: 0, bets: []),
                Game(homeTeam: .denverNuggets, guestTeam: .atlantaHawks, gameDate: Date(), homeScore: 0, guestScore: 0, bets: []),
                Game(homeTeam: .bostonCeltics, guestTeam: .denverNuggets, gameDate: Date(), homeScore: 110, guestScore: 102, bets: [])
            ]
            self?.setLastGame()
            self?.setNextGames()
        })
    }
    
    private func setNextGames() {
        nextGamesVM = games.map { GameVM(game: $0) }
        delegate?.updateNextGames()
    }
    
    private func setLastGame() {
        guard let lastGame = games.last else { return }
        self.lastGameVM = LastGameVM(game: lastGame)
        delegate?.updateLastGame(vm: lastGameVM!)
    }
}
