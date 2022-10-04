//
//  Array.swift
//  WomensEuro2022
//

import Foundation

extension Array where Element == Match {
    var groupStage: [Match] {
        filter { $0.tournamentStage == .groupStage }
    }
    
    var quarterFinal: [Match] {
        filter { $0.tournamentStage == .quarterFinal }
    }
    
    var semiFinal: [Match] {
        filter { $0.tournamentStage == .semiFinal }
    }
    
    var final: [Match] {
        filter { $0.tournamentStage == .final }
    }
}
