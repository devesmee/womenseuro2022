//
//  MapView.swift
//  WomensEuro2022
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53, longitude: -1), span: MKCoordinateSpan(latitudeDelta: 4.85, longitudeDelta: 4.85))
    private let stadiums :[Stadium]
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: stadiums) { stadium in
                MapAnnotation(coordinate: stadium.coordinate) {
                    NavigationLink(destination: StadiumDetailView(stadium: stadium)) {
                        Image("womens-euro-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                    }
                }
            }
            .navigationTitle("Stadiums")
            .background(Color("Background"))
            .preferredColorScheme(.dark)
        }
    }
    
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
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
