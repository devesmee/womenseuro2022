//
//  TournamentStage.swift
//  WomensEuro2022
//

import Foundation

enum TournamentStage: String, Decodable {
    case groupStage = "Group stage"
    case quarterFinal = "Quarter-finals"
    case semiFinal = "Semi final"
    case final = "Final"
}
