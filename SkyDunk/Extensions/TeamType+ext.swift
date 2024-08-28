//
//  TeamType+ext.swift
//  SkyDunk
//
//  Created by aternetas on 11.05.2024.
//

import UIKit

extension TeamType {
    
    var color: UIColor {
        switch self {
        case .bostonCeltics:
            UIColor(resource: .bostonCeltics)
        case .denverNuggets:
            UIColor(resource: .denverNuggets)
        case .atlantaHawks:
            UIColor(resource: .atlantaHawks)
        case .dallasMavericks:
            UIColor(resource: .dallasMavericks)
        case .brooklynNets:
            UIColor(resource: .brooklynNets)
        case .charlotteHornets:
            UIColor(resource: .charlotteHornets)
        case .chicagoBulls:
            UIColor(resource: .chicagoBulls)
        case .clevelandCavaliers:
            UIColor(resource: .clevelandCavaliers)
        case .detroitPistons:
            UIColor(resource: .detroitPistons)
        case .goldenStateWarriors:
            UIColor(resource: .goldenStateWarriors)
        case .houstonRockets:
            UIColor(resource: .houstonRockets)
        case .indianaPacers:
            UIColor(resource: .indianaPacers)
        case .losAngelesLaker:
            UIColor(resource: .losAngelesLakers)
        case .losAngelesClippers:
            UIColor(resource: .losAngelesClippers)
        case .memphisGrizzles:
            UIColor(resource: .memphisGrizzlies)
        case .miamiHeats:
            UIColor(resource: .miamiHeat)
        case .milwaukeeBucks:
            UIColor(resource: .milwaukeeBucks)
        case .minnesotaTimberwolves:
            UIColor(resource: .minnesotaTimberwolves)
        case .newOrleansPelicans:
            UIColor(resource: .newOrleansPelicans)
        case .newYorkKnicks:
            UIColor(resource: .newYorkKnicks)
        case .oklachomaCityThunder:
            UIColor(resource: .oklahomaCityThunder)
        case .orlandoMagic:
            UIColor(resource: .orlandoMagic)
        case .philadelphia76ers:
            UIColor(resource: .philadelphia76Ers)
        case .phoenixSuns:
            UIColor(resource: .phoenixSuns)
        case .portlandTrailBlazers:
            UIColor(resource: .portlandTrailBlazers)
        case .sacramentoKings:
            UIColor(resource: .sacramentoKings)
        case .sanAntonioSpurs:
            UIColor(resource: .sacramentoKings)
        case .torontoRaptors:
            UIColor(resource: .torontoRaptors)
        case .utahJazz:
            UIColor(resource: .utahJazz)
        case .washingtonWizards:
            UIColor(resource: .washingtonWizards)
        case .other:
                .black
        }
    }
    
    var logo: UIImage {
        switch self {
        case .bostonCeltics:
            UIImage(resource: .BOS)
        case .denverNuggets:
            UIImage(resource: .DEN)
        case .atlantaHawks:
            UIImage(resource: .ATL)
        case .dallasMavericks:
            UIImage(resource: .DAL)
        case .brooklynNets:
            UIImage(resource: .BKN)
        case .charlotteHornets:
            UIImage(resource: .CHA)
        case .chicagoBulls:
            UIImage(resource: .CHI)
        case .clevelandCavaliers:
            UIImage(resource: .CLE)
        case .detroitPistons:
            UIImage(resource: .DET)
        case .goldenStateWarriors:
            UIImage(resource: .GSW)
        case .houstonRockets:
            UIImage(resource: .HOU)
        case .indianaPacers:
            UIImage(resource: .IND)
        case .losAngelesLaker:
            UIImage(resource: .LAL)
        case .losAngelesClippers:
            UIImage(resource: .LAC)
        case .memphisGrizzles:
            UIImage(resource: .MEM)
        case .miamiHeats:
            UIImage(resource: .MIA)
        case .milwaukeeBucks:
            UIImage(resource: .MIL)
        case .minnesotaTimberwolves:
            UIImage(resource: .MIN)
        case .newOrleansPelicans:
            UIImage(resource: .NOP)
        case .newYorkKnicks:
            UIImage(resource: .NYK)
        case .oklachomaCityThunder:
            UIImage(resource: .OKC)
        case .orlandoMagic:
            UIImage(resource: .ORL)
        case .philadelphia76ers:
            UIImage(resource: .PHI)
        case .phoenixSuns:
            UIImage(resource: .PHX)
        case .portlandTrailBlazers:
            UIImage(resource: .POR)
        case .sacramentoKings:
            UIImage(resource: .SAC)
        case .sanAntonioSpurs:
            UIImage(resource: .SAS)
        case .torontoRaptors:
            UIImage(resource: .TOR)
        case .utahJazz:
            UIImage(resource: .UTA)
        case .washingtonWizards:
            UIImage(resource: .WAS)
        case .other:
            UIImage(resource: .plusIcon)//TODO: добавить иконку
        }
    }
    
    var fullName: String {
        switch self {
        case .atlantaHawks:
            "Atlanta Hawks"
        case .bostonCeltics:
            "Boston Celtics"
        case .brooklynNets:
            "Brooklyn Nets"
        case .charlotteHornets:
            "Charlotte Hornets"
        case .chicagoBulls:
            "Chicago Bulls"
        case .clevelandCavaliers:
            "Cleveland Cavaliers"
        case .dallasMavericks:
            "Dallas Mavericks"
        case .denverNuggets:
            "Denver Nuggets"
        case .detroitPistons:
            "Detroit Pistons"
        case .goldenStateWarriors:
            "Golden State Warriors"
        case .houstonRockets:
            "Houston Rockets"
        case .indianaPacers:
            "Indiana Pacers"
        case .losAngelesLaker:
            "Los Angeles Laker"
        case .losAngelesClippers:
            "Los Angeles Clippers"
        case .memphisGrizzles:
            "Memphis Grizzles"
        case .miamiHeats:
            "Miami Heats"
        case .milwaukeeBucks:
            "Milwaukee Bucks"
        case .minnesotaTimberwolves:
            "Minnesota Timberwolves"
        case .newOrleansPelicans:
            "New Orleans Pelicans"
        case .newYorkKnicks:
            "New York Knicks"
        case .oklachomaCityThunder:
            "Oklachoma City Thunder"
        case .orlandoMagic:
            "Orlando Magic"
        case .philadelphia76ers:
            "Philadelphia 76ers"
        case .phoenixSuns:
            "Phoenix Suns"
        case .portlandTrailBlazers:
            "Portland Trail Blazers"
        case .sacramentoKings:
            "Sacramento Kings"
        case .sanAntonioSpurs:
            "San Antonio Spurs"
        case .torontoRaptors:
            "Toronto Raptors"
        case .utahJazz:
            "Utah Jazz"
        case .washingtonWizards:
            "Washington Wizards"
        case .other:
            ""
        }
    }
}
