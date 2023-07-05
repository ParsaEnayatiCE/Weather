//
//  FetchWeather.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 7/1/23.
//

import Foundation
import SwiftUI

struct FetchData{
    let apiKey = "470e92fc7dc0ba9953889038c79cd798"
    
    //"https://api.openweathermap.org/data/2.5/weather?q=Tehran&appid=470e92fc7dc0ba9953889038c79cd798&units=metric"
//https://api.openweathermap.org/data/2.5/forecast?lat=51.4215&lon=35.6944&appid=470e92fc7dc0ba9953889038c79cd798&units=metric
    
    //MARK:  - fetch weather
    
    func fetchWeather(cityName: String,completion: @escaping ((cityWeather?) -> Void ) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=metric"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSONWeather(safeData){
                        completion(getWeatherObject(weatherData: weather))
                    }else{
                        //invalid
                        print(error!)
                    }
                }else{
                    print(error!)
                }
            }
            task.resume()
        }
    }
    
    func parseJSONWeather(_ weatherData: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
    //MARK:  - fetch Detail weather
    
    func fetchDetailWeather(lat: Double ,lon: Double,completion: @escaping (CityDetailWeather?) -> Void ){
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lon=\(lon)&lat=\(lat)&appid=\(apiKey)&units=metric"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSONDetailWeather(safeData){
                        print(weather)
                        completion(getWeatherDetailObject(weatherData: weather))
                    }else{
                        print(error!)
                    }
                }else{
                    print(error!)
                }
            }
            task.resume()
        }
    }
    
    func parseJSONDetailWeather(_ weatherDetailData: Data) -> WeatherDetailData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherDetailData.self, from: weatherDetailData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
    func getWeatherDetail() -> CityDetailWeather? {
        if let url = Bundle.main.url(forResource: "Test", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let myModel = try JSONDecoder().decode(WeatherDetailData.self, from: data)
                return getWeatherDetailObject(weatherData: myModel)
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    func getWeatherObject(weatherData : WeatherData) -> cityWeather {
        return cityWeather(lat: weatherData.coord.lat, lon: weatherData.coord.lon, name: weatherData.name, highTemp: "\(weatherData.main.temp_max)", lowTemp: "\(weatherData.main.temp_min)", icon: "sun.max.fill")
    }
    
    func getWeatherDetailObject(weatherData : WeatherDetailData) -> CityDetailWeather {
        var cityhourWeather = [CityHourdWeather]()
        var listOfDeatailWeather =  weatherData.list
        for weather in weatherData.list {
            cityhourWeather.append(CityHourdWeather(maxTemp: "\(weather.main.temp_max)", minTemp: "\(weather.main.temp_min)", time: convertDate(dateString: weather.dt_txt)!, icon: "sun.max.fill"))
        }
        return CityDetailWeather(lat: weatherData.city.coord.lat, lon: weatherData.city.coord.lon , name: weatherData.city.name ?? "0", cityhourWeather: cityhourWeather, sunrise: "\(weatherData.city.sunrise ?? 0)", sunset: "\(weatherData.city.sunset ?? 0)", highTemp: "\(weatherData.list.first?.main.temp_max ?? 0)" , lowTemp: "\(weatherData.list.first?.main.temp_min ?? 0)", humidity: "\(weatherData.list.first?.main.humidity ?? 0)", windDegree: "\(weatherData.list.first?.wind.deg ?? 0)" ,windSpeed : "\(weatherData.list.first?.wind.speed ?? 0)", presure: "\(weatherData.list.first?.main.pressure ?? 0)", icon: "sun.max.fill")
    }
    
    func convertDate(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        dateFormatter.dateFormat = "h a"
        return dateFormatter.string(from: date)
    }
    
//    func getCityDetailWeather(cityWeather : cityWeather) -> CityDetailWeather {
//        fetchDetailWeather(lat: cityWeather.lat, lon: cityWeather.lon,completion: { Result in
//            return Result
//        })
//    }
    
    
}

