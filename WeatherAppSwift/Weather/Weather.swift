//
//  Weather.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 7/1/23.
//

import Foundation

struct cityWeather {
    let lat : Double
    let lon : Double
    let name : String
    let highTemp : String
    let lowTemp : String
    let icon : String
}

struct CityDetailWeather  {
    let lat : Double
    let lon : Double
    let name : String
    let cityhourWeather : [CityHourdWeather]
    let sunrise : String
    let sunset : String
    let highTemp : String
    let lowTemp : String
    let humidity : String
    let windDegree : String
    let windSpeed : String
    let presure : String
    let icon : String
}

struct CityHourdWeather  {
    let maxTemp : String
    let minTemp : String
    let time : String
    let icon : String
}


