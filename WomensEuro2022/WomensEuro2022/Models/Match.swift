//
//  Match.swift
//  WomensEuro2022
//

import Foundation

struct Match: Identifiable, Codable {
    let id = UUID()
    let date: String
    let homeTeam: Countries
    let awayTeam: Countries
    let score: String
    let tournamentStage: TournamentStage
    
    private enum CodingKeys: CodingKey {
        case date, homeTeam, awayTeam, score, tournamentStage
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        homeTeam = try container.decode(Countries.self, forKey: .homeTeam)
        awayTeam = try container.decode(Countries.self, forKey: .awayTeam)
        score = try container.decode(String.self, forKey: .score)
        tournamentStage = try container.decode(TournamentStage.self, forKey: .tournamentStage)
    }
    
    init(date: String, homeTeam: Countries, awayTeam: Countries, score: String, tournamentStage: TournamentStage) {
        self.date = date
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.score = score
        self.tournamentStage = tournamentStage
    }
}
