//
//  TMP.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

var tmpGames = [
    GameDTO(homeTeam: "ATL", guestTeam: "BOS", date: Date.now - 10, homeScore: 99, guestScore: 87, betIds: []),
    GameDTO(homeTeam: "DEN", guestTeam: "MIN", date: Date.now - 298, homeScore: 102, guestScore: 121, betIds: []),
    GameDTO(homeTeam: "UTA", guestTeam: "TOR", date: Date.now - 247922, homeScore: 110, guestScore: 102, betIds: []),
    GameDTO(homeTeam: "LAL", guestTeam: "SAC", date: Date.now + 502433, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "LAC", guestTeam: "IND", date: Date.now + 5033, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "DET", guestTeam: "MIL", date: Date.now + 51033, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "MIA", guestTeam: "DAL", date: Date.now + 2402, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "BOS", guestTeam: "OKC", date: Date.now + 2, homeScore: 0, guestScore: 0, betIds: [])
]

var tmpBets = [
    BetDTO(description: "Takar fw iasen nia yaya", date: Date.now - 2414, amount: 50, coefficient: 2.1, betOn: ["DEN", "MIN"], isSuccess: nil),
    BetDTO(description: "ONknv r", date: Date.now - 23120, amount: 10, coefficient: 1.4, betOn: ["BOS", "ATL"], isSuccess: nil),
    BetDTO(description: "Olt irnesi rins risn ryns owowo sxy rntin orasien rency sni rin ywywyyw", date: Date.now - 23405, amount: 30, coefficient: 3.0, betOn: ["OKC", "UTA"], isSuccess: nil)
]
