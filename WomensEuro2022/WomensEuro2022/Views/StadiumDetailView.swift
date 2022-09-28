//
//  StadiumDetailView.swift
//  WomensEuro2022
//

import SwiftUI

struct StadiumDetailView: View {
    let stadium: Stadium
    
    var body: some View {
        VStack(spacing: 0) {
            StadiumInfo(stadium: stadium)
            
            List() {
                if stadium.matches.first(where: { $0.tournamentStage == .groupStage } ) != nil {
                    Section("Group stage") {
                        ForEach(stadium.matches.filter {m in m.tournamentStage == .groupStage} , id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                        .lineSpacing(10)
                    }
                }
                
                if stadium.matches.first(where: { $0.tournamentStage == .quarterFinal } ) != nil {
                    Section("Quarter-finals") {
                        ForEach(stadium.matches.filter {m in m.tournamentStage == .quarterFinal} , id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                    }
                }
                
                if stadium.matches.first(where: { $0.tournamentStage == .semiFinal } ) != nil {
                    Section("Semi-finals") {
                        ForEach(stadium.matches.filter {m in m.tournamentStage == .semiFinal }, id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                    }
                }
                
                if stadium.matches.first(where: { $0.tournamentStage == .final } ) != nil {
                    Section("Final") {
                        ForEach(stadium.matches.filter {m in m.tournamentStage == .final} , id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .background(Color("Background"))
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct StadiumDetailView_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "11 July 2022", homeTeam: Countries.austria, awayTeam: Countries.northernIreland, score: "2 - 0", tournamentStage: .groupStage)
    static let exampleStadium = Stadium(name: "Old Trafford", city: "Manchester", latitude: 53.46308522200754, longitude: -2.2913398114888857, matches: [exampleMatch])
    
    static var previews: some View {
        StadiumDetailView(stadium: exampleStadium)
    }
}
