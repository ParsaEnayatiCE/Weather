//
//  SearchView.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/30/23.
//

import SwiftUI

struct SearchView: View {
    @State var userInput : String
    @EnvironmentObject var cityWeathers1 : Weathers
    @EnvironmentObject var cityWeathers2 : DetailWeathers
    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                SearchCardView(searchText: $userInput)
                    .padding(5)
                    .padding(.top,20)
                
                Image(systemName: "plus.app")
                    .onTapGesture {
                        let fetcher = FetchData()
                        cityWeathers2.detailItems.append(fetcher.getWeatherDetail()!)
                        fetcher.fetchWeather(cityName: "\($userInput.wrappedValue)",completion: { respons in
                            if let city = respons{
                                let cityResponse = cityWeather(lat: city.lat, lon: city.lon, name: city.name, highTemp: city.highTemp, lowTemp: city.lowTemp, icon: "sun.max.fill")
                                cityWeathers1.items.append(cityResponse)
                                fetcher.fetchDetailWeather(lat: city.lat, lon: city.lon) { result in
                                    if let cityDetail = result {
                                        let cityDetailResponse = CityDetailWeather(lat: cityDetail.lat, lon: cityDetail.lon, name: cityDetail.name, cityhourWeather: cityDetail.cityhourWeather, sunrise:cityDetail.sunrise, sunset: cityDetail.sunset, highTemp: cityDetail.highTemp, lowTemp: cityDetail.lowTemp, humidity: cityDetail.humidity, windDegree: cityDetail.windDegree, windSpeed: cityDetail.windSpeed, presure: cityDetail.presure, icon: "sun.max.fill")
                                        cityWeathers2.detailItems.append(cityDetailResponse)
                                    }
                                }
                                
                            }
                        })
                        
                    }
                    .imageScale(.large)
                    .padding(.top,100)
                    .tint(Color.black)
                Spacer()
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(userInput: "")
    }
}
