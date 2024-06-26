//
//  TMP.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

var tmpGames = [
    GameDTO(homeTeam: "BOS", guestTeam: "ATL", gameDate: Date().add(hours: 10), homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "DEN", guestTeam: "BOS", gameDate: Date().add(months: -1), homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "DAL", guestTeam: "ATL", gameDate: Date().add(days: 5, minutes: 20), homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "BOS", guestTeam: "DAL", gameDate: Date().add(years: -3), homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(homeTeam: "DEN", guestTeam: "ATL", gameDate: Date.getByText("2015 03 22 13:54") ?? Date(), homeScore: 102, guestScore: 121, betIds: []),
    GameDTO(homeTeam: "BOS", guestTeam: "DEN", gameDate: Date.getByText("2015 03 22", format: "yyyy MM dd") ?? Date(), homeScore: 110, guestScore: 102, betIds: [])
]
