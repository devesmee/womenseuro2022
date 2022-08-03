//
//  MapView.swift
//  WomensEuro2022
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53, longitude: -1), span: MKCoordinateSpan(latitudeDelta: 4.85, longitudeDelta: 4.85))
    private let viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: viewModel.stadiums) { stadium in
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
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
