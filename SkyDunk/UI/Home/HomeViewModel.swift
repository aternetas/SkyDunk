//
//  HomeViewModel.swift
//  SkyDunk
//
//  Created by f f on 10.05.2024.
//

import UIKit

protocol HomeViewModelDelegat {
    func updateLastGame(vm: LastGameVM)
}

class HomeViewModel {
    var delegate: HomeViewModelDelegat?
    
    var lastGameVM = LastGameVM(homeTeam: "LAL", guestTeam: "BOS", homeTeamScore: 101, guestTeamScore: 116, date: Date())
    
    func getLastGame() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            self?.delegate?.updateLastGame(vm: LastGameVM(homeTeam: "LAL", guestTeam: "BOS", homeTeamScore: 101, guestTeamScore: 116, date: Date()))
        })
    }
}
