//
//  Setting.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/29/23.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("isDarkMode") private var isDark = false
    @EnvironmentObject var listSize : Settings
    @State private var itemsInTheList = 10
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Stepper("Cities In The List", value: $itemsInTheList, in: 0...130)
                        Text("\(itemsInTheList)")
                    }
                        .listRowSeparator(.hidden)
                    Toggle("Dark Mode", isOn: $isDark)
                        
                }
                .padding(.horizontal,15)
                .padding(.vertical, 15)
                .background(Color(.secondarySystemFill))
                .cornerRadius(30)
                .listRowBackground(Color.clear)
            }
            .background(BackgroundView())
            .foregroundColor(Color.black)
            .scrollContentBackground(.hidden)
            .navigationTitle("Setting")
            
        }
        .environment(\.colorScheme, isDark ? .dark : .light)
        
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
