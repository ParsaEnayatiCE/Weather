//
//  FavoriteView.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/29/23.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var cityWeathers : Weathers
    @EnvironmentObject var cityDetailWeathers : DetailWeathers
    @EnvironmentObject var listSize: Settings
    var body: some View {
        NavigationStack {
            List {
                ForEach(cityWeathers.items,id:\.name) { cityWeather in
                    NavigationLink(destination: ForeCastView(cityDetailWeather: findCityInArray(city: cityWeather)!)) {
                        CardView(city: cityWeather.name, highTemp: cityWeather.highTemp, lowTemp: cityWeather.lowTemp, icon: Image(systemName: cityWeather.icon))
                            .background(Color.clear)
                    }
                }
                .onDelete(perform: removeItems)
            }
            
            .background(BackgroundView())
            .foregroundColor(Color.black)
            .scrollContentBackground(.hidden)
            .navigationTitle("Favorite Cities")
            .toolbar{
                EditButton()
                    .fontWeight(.medium)
                    .tint(Color.black)
            }
            .toolbar{
                NavigationLink (destination: SearchView(userInput: "")){
                    Image(systemName: "plus")
                        .tint(Color.black)
                }
            }
            
        }
    }
    func removeItems(at offsets: IndexSet) {
        cityWeathers.items.remove(atOffsets: offsets)
        cityDetailWeathers.detailItems.remove(atOffsets: offsets)
    }
    
    func findCityInArray(city : cityWeather) -> CityDetailWeather? {
        return cityDetailWeathers.detailItems.last
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().preferredColorScheme(.light)
    }
}
