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
                if !matches.groupStage.isEmpty {
                    Section("Group stage") {
                        ForEach(matches.groupStage, id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                        .lineSpacing(10)
                    }
                }
                
                if !matches.quarterFinal.isEmpty {
                    Section("Quarter-finals") {
                        ForEach(matches.quarterFinal, id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                        .lineSpacing(10)
                    }
                }
                
                if !matches.semiFinal.isEmpty {
                    Section("Semi-finals") {
                        ForEach(matches.semiFinal, id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                        .lineSpacing(10)
                    }
                }
                
                if !matches.final.isEmpty {
                    Section("Final") {
                        ForEach(matches.final, id: \.id) {
                            match in
                            MatchListRow(match: match)
                        }
                        .lineSpacing(10)
                    }
                }
            }
            .listStyle(.plain)
        }
        .background(Color("Background"))
        .navigationBarTitle("", displayMode: .inline)
    }
    
    private var matches: [Match] {
        return stadium.matches
    }
}

struct StadiumDetailView_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "11 July 2022", homeTeam: Countries.austria, awayTeam: Countries.northernIreland, score: "2 - 0", tournamentStage: .groupStage)
    static let exampleStadium = Stadium(name: "Old Trafford", city: "Manchester", latitude: 53.46308522200754, longitude: -2.2913398114888857, matches: [exampleMatch])
    
    static var previews: some View {
        StadiumDetailView(stadium: exampleStadium)
    }
}
