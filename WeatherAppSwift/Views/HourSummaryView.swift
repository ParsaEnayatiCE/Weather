//
//  HourSummaryView.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/30/23.
//

import SwiftUI

struct HourSummaryView: View {
    let temp: String
    let icon: Image?
    let time: String

    var body: some View {
        VStack(spacing: 16) {
            Text(temp)
                .font(.caption)
                .fontWeight(.medium)
            icon?
                .renderingMode(.original)
                .imageScale(.large)
            Text(time)
                .font(.caption)
                .fontWeight(.medium)
        }
        .frame(width: 60, height: 90)
        .padding(10)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct HourSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        HourSummaryView(temp: "19", icon: Image(systemName: "sun.min"), time: "12AM")
    }
}
