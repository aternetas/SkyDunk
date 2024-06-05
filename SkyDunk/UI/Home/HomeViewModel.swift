//
//  HomeViewModel.swift
//  SkyDunk
//
//  Created by aternetas on 10.05.2024.
//

import Foundation

protocol HomeViewModelDelegat {
    func updateLastGame(vm: LastGameVM)
    func updateNextGames()
    func updateActiveBets()
    func updateActiveBet(index: Int)
}

class HomeViewModel: BaseViewModel {
    
    var delegate: HomeViewModelDelegat?
    var nextGamesVM: [GameVM] = []
    var lastGameVM: LastGameVM? = nil
    var activeBetsVM: [BetVM] = []
    private var games: [Game] = []
    private var activeBets: [Bet] = []
    
    func viewDidLoad() {
        getGames()
        getActiveBets()
    }
    
    func selectGame(id: String) {
        let game = games.first(where: { $0.id == id } )
        if let game = game {
            navigationManager?.openScreen(screen: .game(game: game))
        }
    }
    
    private func getGames() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            guard let self = self else { return }
            self.games = [
                Game(homeTeam: .bostonCeltics, guestTeam: .atlantaHawks, gameDate: Date.now + 502433, homeScore: 0, guestScore: 0,
                     bets: [Bet(description: "fias satao fit xiiu aiobx oteswy te qotn ydcn innie3 tktk", date: Date(), amount: 10, coefficient: 2, teams: [TeamType.bostonCeltics, TeamType.atlantaHawks], isSuccess: nil),
                            Bet(description: "fias satao fit xiiu", date: Date(), amount: 10, coefficient: 2, teams: [TeamType.atlantaHawks], isSuccess: nil),
                            Bet(description: "fias s10 1213 123", date: Date(), amount: 330, coefficient: 2.8, teams: [TeamType.bostonCeltics], isSuccess: nil),
                           ]),
                
                Game(homeTeam: .denverNuggets, guestTeam: .bostonCeltics, gameDate: Date.now + 5033, homeScore: 0, guestScore: 0, bets: [Bet(description: "tr aeiny renit aosi snnt ycce 2 teet naie;yyy xenaieoi ynyrnynuyw sn ain ir iw aytyty", date: Date(), amount: 200, coefficient: 1.4, teams: [TeamType.denverNuggets, TeamType.bostonCeltics], isSuccess: true)]),
                
                Game(homeTeam: .dallasMavericks, guestTeam: .atlantaHawks, gameDate: Date.now + 51033, homeScore: 0, guestScore: 0, bets: [
                    Bet(description: "now cell i bought rain bet ball deny democratic main chair amazing comic tech melt inauguration police skibidi", date: Date(), amount: 200, coefficient: 1.4, teams: [TeamType.dallasMavericks, TeamType.atlantaHawks], isSuccess: true),
                    Bet(description: "ta 2 aie cyyc ainni xeinintya ntein xieni", date: Date(), amount: 45.5, coefficient: 3.21, teams: [TeamType.dallasMavericks, TeamType.atlantaHawks], isSuccess: false),
                    Bet(description: "at asyysae 0nria veni aiesnty ew itna ytn riatny seinai yns iti", date: Date(), amount: 10.5, coefficient: 2.32, teams: [TeamType.dallasMavericks, TeamType.atlantaHawks], isSuccess: nil)
                ]),
                
                Game(homeTeam: .bostonCeltics, guestTeam: .dallasMavericks, gameDate: Date.now + 2402, homeScore: 0, guestScore: 0, bets: []),
                Game(homeTeam: .denverNuggets, guestTeam: .atlantaHawks, gameDate: Date.now - 298355, homeScore: 102, guestScore: 121, bets: []),
                Game(homeTeam: .bostonCeltics, guestTeam: .denverNuggets, gameDate: Date.now - 247922, homeScore: 110, guestScore: 102, bets: [Bet(description: "at asyysae 0nria veni aiesnty ew itna ytn riatny seinai yns iti", date: Date(), amount: 10.5, coefficient: 2.32, teams: [TeamType.bostonCeltics, TeamType.denverNuggets], isSuccess: nil)])
            ]
            self.setLastGame()
            self.setNextGames()
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
    
    private func getActiveBets() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            guard let self = self else { return }
            self.activeBets = [
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil),
                Bet(description: "Sbviu sin kmckiy kasen keviyt sitnai ciay asenait snianyrt serian saetieayyy", date: Date(), amount: 10, coefficient: 2.1, teams: [.atlantaHawks], isSuccess: nil),
                Bet(description: "Starn keviyt sitnai ciay", date: Date(), amount: 13, coefficient: 1.3, teams: [.atlantaHawks, .bostonCeltics], isSuccess: nil)
            ]
            self.setActiveBets()
        })
    }
    
    private func setActiveBets() {
        activeBetsVM = activeBets.filter { $0.isSuccess == nil }
            .map {BetVM(bet: $0, delegate: self)}
        if activeBets.count > 0 {
            delegate?.updateActiveBets()
        }
    }
}

extension HomeViewModel: BetCellListenerProtocol {
    
    func tapOnSuccessBet(id: String) {
        changeBetStatus(id: id, isSuccess: true)
    }
    
    func tapOnFailureBet(id: String) {
        changeBetStatus(id: id, isSuccess: false)
    }
    
    func tapOnBet(id: String) {
        guard let index = activeBetsVM.firstIndex(where: { $0.id == id}) else { return }
        activeBetsVM[index] = activeBetsVM[index].copy(description: activeBetsVM[index].description + " CHANGE")
        delegate?.updateActiveBet(index: index)
    }
    
    private func changeBetStatus(id: String, isSuccess: Bool) {
        guard let index = activeBetsVM.firstIndex(where: { $0.id == id}) else { return }
        activeBetsVM[index] = activeBetsVM[index].copy(isActive: false, isSuccess: isSuccess)
        delegate?.updateActiveBet(index: index)
    }
}
