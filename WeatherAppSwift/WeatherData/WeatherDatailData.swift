//
//  WeatherDatailData.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 7/2/23.
//

import Foundation

struct WeatherDetailData: Decodable {
    var cod: String
    var message: Int
    var cnt: Int
    var list: [List]
    var city: City
    
    struct List: Decodable {
        var dt: Int
        var main: Main
        var weather: [Weather]
        var clouds: Clouds
        var wind: Wind
        var visibility: Int
        var pop: Double
        var rain: Rain?
        var sys: Sys
        var dt_txt: String
        
        struct Main: Decodable {
            var temp: Double
            var feels_like: Double
            var temp_min: Double
            var temp_max: Double
            var pressure: Int
            var sea_level: Int
            var grnd_level: Int
            var humidity: Int
            var temp_kf: Double
        }
        
        struct Weather: Decodable {
            var id: Int
            var main: String
            var description: String
            var icon: String
        }
        
        struct Clouds: Decodable {
            var all: Int
        }
        
        struct Wind: Decodable {
            var speed: Double
            var deg: Int
            var gust: Double
        }
        
        struct Rain: Decodable {
            var h3h: Double
            
            enum CodingKeys: String, CodingKey {
                case h3h = "3h"
            }
        }
        
        struct Sys: Decodable {
            var pod: String
        }
    }
    
    struct City: Decodable {
        var id: Int
        var name: String
        var coord: Coord
        var country: String
        var population: Int
        var timezone: Int
        var sunrise: Int
        var sunset: Int
        
        struct Coord: Decodable {
            var lat: Double
            var lon: Double
        }
    }
}
