//
//  TMP.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

var tmpGames = [
    GameDTO(homeTeam: "ATL", guestTeam: "BOS", date: Date.now - 10, homeScore: 99, guestScore: 87, betIds: []),
    GameDTO(homeTeam: "DEN", guestTeam: "ATL", date: Date.now - 298, homeScore: 102, guestScore: 121, betIds: []),
    GameDTO(homeTeam: "BOS", guestTeam: "DEN", date: Date.now - 247922, homeScore: 110, guestScore: 102, betIds: []),
    GameDTO(homeTeam: "BOS", guestTeam: "ATL", date: Date.now + 502433, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "DEN", guestTeam: "BOS", date: Date.now + 5033, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "DAL", guestTeam: "ATL", date: Date.now + 51033, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "BOS", guestTeam: "DAL", date: Date.now + 2402, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "BOS", guestTeam: "DAL", date: Date.now + 2, homeScore: 0, guestScore: 0, betIds: [])
]

var tmpBets = [
    BetDTO(description: "Takar fw iasen nia yaya", date: Date.now, amount: 0.0, coefficient: 0.0, betOn: ["DEN", "MIN"], isSuccess: nil),
    BetDTO(description: "ONknv r", date: Date.now, amount: 0.0, coefficient: 0.0, betOn: ["BOS", "ATL"], isSuccess: nil),
    BetDTO(description: "Olt irnesi rins risn ryns owowo sxy rntin orasien rency sni rin ywywyyw", date: Date.now, amount: 0.0, coefficient: 0.0, betOn: ["OKC", "UTA"], isSuccess: nil)
]
