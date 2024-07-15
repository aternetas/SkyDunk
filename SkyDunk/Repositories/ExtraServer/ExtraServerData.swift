//
//  ExtraServerData.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

var games = [
    GameDTO(id: "NTKU-AKXI-3KIA", homeTeam: "DEN", guestTeam: "LAL", date: .now - 800, homeScore: 98, guestScore: 102, activeBetsAmount: 0, betsResult: nil),
    GameDTO(id: "NTAI-2KTA-RAKR", homeTeam: "ATL", guestTeam: "BOS", date: .now - 1000, homeScore: 99, guestScore: 87, activeBetsAmount: 0, betsResult: 90),
    GameDTO(id: "TNOA-AKCC-CAOY", homeTeam: "DEN", guestTeam: "MIN", date: .now - 29800, homeScore: 102, guestScore: 121, activeBetsAmount: 0, betsResult: -24),
    GameDTO(id: "KT0C-CNIR-RIUX", homeTeam: "MIA", guestTeam: "LAL", date: .now - 24152, homeScore: 121, guestScore: 115, activeBetsAmount: 1, betsResult: -9.08),
    GameDTO(id: "AT20-RKOR-PYZ.", homeTeam: "UTA", guestTeam: "TOR", date: .now - 247922, homeScore: 110, guestScore: 102, activeBetsAmount: 0, betsResult: nil),
    GameDTO(id: "20!I-AKZO-R;AK", homeTeam: "LAL", guestTeam: "SAC", date: .now + 502433, homeScore: 0, guestScore: 0, activeBetsAmount: 1, betsResult: nil),
    GameDTO(id: "29ZK-RKXY-IR..", homeTeam: "LAC", guestTeam: "IND", date: .now + 5033, homeScore: 0, guestScore: 0, activeBetsAmount: 2, betsResult: nil),
    GameDTO(id: "20BX-AOYT-KTKT", homeTeam: "DET", guestTeam: "MIL", date: .now + 51033, homeScore: 0, guestScore: 0, activeBetsAmount: 0, betsResult: nil),
    GameDTO(id: "3ORY-TIXK-IXEN", homeTeam: "MIA", guestTeam: "DAL", date: .now + 2402, homeScore: 0, guestScore: 0, activeBetsAmount: 0, betsResult: nil),
    GameDTO(id: "IGKI-NI,Z-AIEU", homeTeam: "BOS", guestTeam: "OKC", date: .now + 2, homeScore: 0, guestScore: 0, activeBetsAmount: 0, betsResult: nil)
]

var bets = [
    BetDTO(id: "02NTO-RKIX9", gameId: "NTAI-2KTA-RAKR", description: "Boston will win", created: .now - 2340, amount: 30, coefficient: 3.0, betOn: ["ATL", "BOS"], isSuccess: true),
    
    BetDTO(id: "OXYMR-RI90X", gameId: "TNOA-AKCC-CAOY", description: "Edwards > 20 points", created: .now - 35000, amount: 10, coefficient: 2.2, betOn: ["DEN", "MIN"], isSuccess: true),
    BetDTO(id: "AT0AK-ANOXY", gameId: "TNOA-AKCC-CAOY", description: "Aaron Gordon is MVP of the game", created: .now - 33204, amount: 20, coefficient: 2.3, betOn: ["DEN", "MIN"], isSuccess: false),
    
    BetDTO(id: "NIKRX-RIKCIR", gameId: "KT0C-CNIR-RIUX", description: "Lebron punched his son", created: .now - 26000, amount: 24.2, coefficient: 2.6, betOn: ["MIA", "LAL"], isSuccess: true),
    BetDTO(id: "AOXER-X[2KTR", gameId: "KT0C-CNIR-RIUX", description: "Bald Jimmy", created: .now - 26500, amount: 21, coefficient: 1.9, betOn: ["MIA", "LAL"], isSuccess: nil),
    BetDTO(id: "NAZOY-QB9ZA", gameId: "KT0C-CNIR-RIUX", description: "Kevin Love made 3 more 3-pts", created: .now - 27109, amount: 30, coefficient: 2.4, betOn: ["MIA", "LAL"], isSuccess: false),
    
    BetDTO(id: "TOAYK-ABXOY", gameId: "20!I-AKZO-R;AK", description: "Sacramento will win", created: .now - 10, amount: 10, coefficient: 1.4, betOn: ["LAL", "SAC"], isSuccess: nil),
    
    BetDTO(id: "KAOYK-WIKXO", gameId: "29ZK-RKXY-IR..", description: "Tyrese > 20 but < 30 point", created: .now - 1250, amount: 20, coefficient: 1.76, betOn: ["LAC", "IND"], isSuccess: nil),
    BetDTO(id: "OA0XK-ATRKB", gameId: "29ZK-RKXY-IR..", description: "Beared man will cut his beard", created: .now - 2305, amount: 40, coefficient: 1.8, betOn: ["LAC", "IND"], isSuccess: nil)
]
