//
//  MatchListRow.swift
//  WomensEuro2022
//

import SwiftUI

struct MatchListRow: View {
    let match: Match
    
    var body: some View {
        VStack(spacing: 0) {
            Text(match.date)
                .font(.callout.italic())
            ZStack {
                HStack {
                    Spacer()
                    Text(match.score)
                        .fontWeight(.semibold)
                    Spacer()
                }
                HStack {
                    Image(match.homeTeam.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    Text(match.homeTeam.rawValue)
                        .fontWeight(.semibold)
                        .frame(width: 100, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(match.awayTeam.rawValue)
                        .fontWeight(.semibold)
                        .frame(width: 100, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                    Image(match.awayTeam.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                }
                .lineLimit(2)
                .lineSpacing(0)
            }
        }
        .listRowBackground(Color("Background"))
    }
}

struct MatchListRow_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "11 July 2022", homeTeam: Countries.austria, awayTeam: Countries.northernIreland, score: "2 - 0", tournamentStage: .groupStage)
    
    static var previews: some View {
        MatchListRow(match: exampleMatch)
    }
}
