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
    static var previews: some View {
        StadiumInfo(stadium: ViewModel.exampleStadium)
    }
}
