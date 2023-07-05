//
//  WeatherAppSwiftApp.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/29/23.
//

import SwiftUI

@main
struct WeatherAppSwiftApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = true
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(DetailWeathers())
                .environmentObject(Weathers())
                .environmentObject(Settings())
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}


