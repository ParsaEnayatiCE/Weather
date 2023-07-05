//
//  ForeCastView.swift
//  WeatherAppSwift
//
//  Created by Soheil Homayoonfard on 6/30/23.
//

import SwiftUI

struct ForeCastView: View {
    let cityDetailWeather : CityDetailWeather
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        currentWeatherView
                        currentSummaryView

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(cityDetailWeather.cityhourWeather,id:\.time){ cityhourWeather in
                                    HourSummaryView(temp: cityDetailWeather.lowTemp ?? "0", icon: Image(systemName: "sun.min"), time: cityhourWeather.time ?? "0")
                                }
                            }
                        }
                        .padding()
                    }
                }
                Spacer()
            }
        }
    }

    private var currentWeatherView: some View {
        return AnyView(
            HStack {
                VStack(spacing: 4) {
                    Text((cityDetailWeather.name ?? "0"))
                        .font(.title)
                        .fontWeight(.medium)
                    HStack {
                        Image(systemName: "sun.max.fill")
                            .renderingMode(.original)
                            .imageScale(.small)
                        Text(cityDetailWeather.highTemp ?? "0")
                            .fontWeight(.semibold)
                    }.font(.system(size: 54))
                        .frame(maxWidth: .infinity)
                    Text("\(cityDetailWeather.highTemp ?? "0") - \(cityDetailWeather.lowTemp ?? "0")")
                        .foregroundColor(.secondary)
                }
            }
        )
    }

    private var currentSummaryView: some View {
        return AnyView(
            VStack {
                ZStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            detailView(text: cityDetailWeather.sunrise,
                                       image: .init(systemName: "sunrise"),
                                       offset: .init(width: 0, height: -2))

                            detailView(text: cityDetailWeather.sunset,
                                       image: .init(systemName: "sunset"),
                                       offset: .init(width: 0, height: -2))
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        detailView(text: cityDetailWeather.presure,
                                   image: .init(systemName: "aqi.low"))

                        detailView(text: "\(cityDetailWeather.humidity)%",
                                   image: .init(systemName: "humidity"))
                    }

                    HStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 6) {
                            detailView(text: "\(cityDetailWeather.windSpeed)km/h",
                                       image: .init(systemName: "wind"))

                            detailView(text: cityDetailWeather.windDegree,
                                       image: .init(systemName: "arrow.up.right.circle"))
                        }
                    }
                }
                .padding()
            }
        )
    }


    private func detailView(text: String, image: Image, offset: CGSize = .zero) -> some View {
        HStack {
            image
                .imageScale(.medium)
                .foregroundColor(Color("AppTint"))
                .offset(offset)
            Text(text)
        }
    }
}

//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        var fetch : FetchData
//        ForeCastView(cityDetailWeather: fetch.getWeatherDetail()!)
//    }
//}
