//
//  StadiumInfo.swift
//  WomensEuro2022
//

import SwiftUI

struct StadiumInfo: View {
    let stadium: Stadium
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(stadium.name)
                .resizable()
                .frame(height: 200)
            
            Rectangle()
                .fill(.black.opacity(0.7))
                .frame(height: 55)
            
            VStack {
                Text(stadium.name)
                    .font(.title3.bold())
                Text(stadium.city)
            }
            .padding(.bottom, 5)
        }
    }
}

struct StadiumInfo_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "11 July 2022", homeTeam: Countries.austria, awayTeam: Countries.northernIreland, score: "2 - 0", tournamentStage: .groupStage)
    static let exampleStadium = Stadium(name: "Old Trafford", city: "Manchester", latitude: 53.46308522200754, longitude: -2.2913398114888857, matches: [exampleMatch])
    
    static var previews: some View {
        StadiumInfo(stadium: exampleStadium)
    }
}
