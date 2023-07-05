//
//  CardView.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/30/23.
//

import SwiftUI

struct CardView: View {
    let city: String
    let highTemp: String
    let lowTemp: String
    let icon: Image?
    
    var body: some View {
        HStack {
            Text(city)
                .fontWeight(.medium)
            Spacer()
            Text("\(highTemp) / \(lowTemp)")
                .fontWeight(.light)
            icon?
                .renderingMode(.original)
                .imageScale(.large)
        }
        .padding(.horizontal,10)
        .padding(.vertical, 15)
        .background(Color(.secondarySystemFill))
        .cornerRadius(20)
        .listRowBackground(Color.clear)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(city: "Tehran", highTemp: "19", lowTemp: "16", icon: Image(systemName: "sun.max.fill"))
    }
}
