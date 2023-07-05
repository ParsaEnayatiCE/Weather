//
//  RootView.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/29/23.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        ZStack{
            BackgroundView()
            TabView {
                FavoriteView()
                    .tabItem() {
                        Label("Favorite", systemImage: "list.star")
                    }
                SettingView()
                    .tabItem() {
                        Label("Setting", systemImage: "gear")
                    }
            }
            .tint(.white)
        }
    }
}

struct RoottView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().preferredColorScheme(.dark)
    }
}
