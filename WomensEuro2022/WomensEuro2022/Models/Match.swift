//
//  Match.swift
//  WomensEuro2022
//

import Foundation

struct Match: Identifiable, Decodable {
    let id = UUID()
    let date: String
    let homeTeam: Countries
    let awayTeam: Countries
    let score: String
    let tournamentStage: TournamentStage
    
    init(date: String, homeTeam: Countries, awayTeam: Countries, score: String, tournamentStage: TournamentStage) {
        self.date = date
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.score = score
        self.tournamentStage = tournamentStage
    }
}
