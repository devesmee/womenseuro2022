//
//  ViewModel.swift
//  WomensEuro2022
//

import Foundation
import CoreLocation

struct ViewModel {
    let stadiums: [Stadium]
    
    init() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedData = try JSONDecoder().decode([Stadium].self, from: data)
                self.stadiums = decodedData
                return
            } catch {
                print("Something went wrong when fetching data")
                print(error)
            }
        }
        self.stadiums = []
    }
    
    static let exampleStadium = Stadium(name: "Old Trafford", city: "Manchester", latitude: 53.46308522200754, longitude: -2.2913398114888857, matches: [exampleMatch])
    
    static let exampleMatch = Match(date: "11 July 2022", homeTeam: Countries.austria, awayTeam: Countries.northernIreland, score: "2 - 0", tournamentStage: .groupStage)
}
