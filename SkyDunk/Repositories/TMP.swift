//
//  TMP.swift
//  SkyDunk
//
//  Created by Nebo on 10.06.2024.
//

import Foundation

var tmpGames = [
    GameDTO(id: "NTAI-2KTA-RAKR", homeTeam: "ATL", guestTeam: "BOS", date: Date.now - 1000, homeScore: 99, guestScore: 87, betIds: ["02NTO-RKIX9"]),
    GameDTO(id: "TNOA-AKCC-CAOY", homeTeam: "DEN", guestTeam: "MIN", date: Date.now - 29800, homeScore: 102, guestScore: 121, betIds: ["OXYMR-RI90X", "AT0AK-ANOXY"]),
    GameDTO(id: "AT20-RKOR-PYZ.", homeTeam: "UTA", guestTeam: "TOR", date: Date.now - 247922, homeScore: 110, guestScore: 102, betIds: []),
    GameDTO(id: "20!I-AKZO-R;AK", homeTeam: "LAL", guestTeam: "SAC", date: Date.now + 502433, homeScore: 0, guestScore: 0, betIds: ["TOAYK-ABXOY"]),
    GameDTO(id: "29ZK-RKXY-IR..", homeTeam: "LAC", guestTeam: "IND", date: Date.now + 5033, homeScore: 0, guestScore: 0, betIds: ["KAOYK-WIKXO", "OA0XK-ATRKB"]),
    GameDTO(id: "20BX-AOYT-KTKT", homeTeam: "DET", guestTeam: "MIL", date: Date.now + 51033, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(id: "3ORY-TIXK-IXEN", homeTeam: "MIA", guestTeam: "DAL", date: Date.now + 2402, homeScore: 0, guestScore: 0, betIds: []),
    GameDTO(id: "IGKI-NI,Z-AIEU", homeTeam: "BOS", guestTeam: "OKC", date: Date.now + 2, homeScore: 0, guestScore: 0, betIds: [])
]

var tmpBets = [
    BetDTO(id: "RTKIT-RKIDU", gameId: "KOLT-AKTI-R2IN", description: "Takar fw iasen nia yaya", betCreated: Date.now - 2414, amount: 50, coefficient: 2.1, betOn: ["DEN", "MIN"], isSuccess: nil),
    BetDTO(id: "EIRNX-AK29I", gameId: "NMMT-W23K-RKAO", description: "ONknv r", betCreated: Date.now - 23120, amount: 10, coefficient: 1.4, betOn: ["BOS", "ATL"], isSuccess: nil),
    BetDTO(id: "0ANKX-AN0RK", gameId: "TKI2-AK2I-2KTI", description: "Olt irnesi rins risn ryns owowo sxy rntin orasien rency sni rin ywywyyw", betCreated: Date.now - 23405, amount: 30, coefficient: 3.0, betOn: ["OKC", "UTA"], isSuccess: nil),
    BetDTO(id: "02NTO-RKIX9", gameId: "NTAI-2KTA-RAKR", description: "Boston will win", betCreated: Date.now - 2340, amount: 30, coefficient: 3.0, betOn: ["ATL", "BOS"], isSuccess: true),
    BetDTO(id: "OXYMR-RI90X", gameId: "TNOA-AKCC-CAOY", description: "Edwards > 20 points", betCreated: Date.now - 35000, amount: 10, coefficient: 2.2, betOn: ["DEN", "MIN"], isSuccess: true),
    BetDTO(id: "AT0AK-ANOXY", gameId: "TNOA-AKCC-CAOY", description: "Aaron Gordon is MVP of the game", betCreated: Date.now - 33204, amount: 20, coefficient: 2.3, betOn: ["DEN", "MIN"], isSuccess: false),
    BetDTO(id: "TOAYK-ABXOY", gameId: "20!I-AKZO-R;AK", description: "Sacramento will win", betCreated: Date.now - 10, amount: 10, coefficient: 1.4, betOn: ["LAL", "SAC"], isSuccess: nil),
    BetDTO(id: "KAOYK-WIKXO", gameId: "29ZK-RKXY-IR..", description: "Tyrese > 20 but < 30 point", betCreated: Date.now - 1250, amount: 20, coefficient: 1.76, betOn: ["LAC", "IND"], isSuccess: nil),
    BetDTO(id: "OA0XK-ATRKB", gameId: "29ZK-RKXY-IR..", description: "Beared man will cut his beard", betCreated: Date.now - 2305, amount: 40, coefficient: 1.8, betOn: ["LAC", "IND"], isSuccess: nil)
]
