//
//  Weathers.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 7/1/23.
//

import Foundation

class Weathers: ObservableObject {
    @Published var items = [cityWeather]()
}

class DetailWeathers: ObservableObject {
    @Published var detailItems = [CityDetailWeather]()
}
