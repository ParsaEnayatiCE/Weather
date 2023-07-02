//
//  BackgroundView.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/30/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        
        LinearGradient(gradient:
                        Gradient(colors: [
                            Color("AppBackground"),
                            Color("AppBackground"),
                            Color("AppTint")])
                       , startPoint: .top, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
