//
//  currentWeatherView.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/02.
//

import SwiftUI

struct currentWeatherView: View {
    @ObservedObject var reInfo = returnInfo
    var body: some View {
        NavigationView {
            List {
                Group {
                    InfoBlock(title: "Weather", info: "\(reInfo.data.wea)", img: nil, tips: nil)
                    InfoBlock(title: "Temperature", info: "\(reInfo.data.tem)", img: nil, tips: nil)
                    InfoBlock(title: "Temp Range", info: "\(reInfo.data.tem2) ~ \(reInfo.data.tem1)", img: nil, tips: nil)
                    InfoBlock(title: "Humidity", info: "\(reInfo.data.humidity)", img: nil, tips: nil)
                    InfoBlock(title: "Air Quality", info: "(AQI) \(reInfo.data.air)   \(reInfo.data.air_level)", img: nil, tips: "Air Tips: \(reInfo.data.air_tips)")
                    InfoBlock(title: "Visibility", info: "\(reInfo.data.visibility)", img: nil, tips: nil)
                    InfoBlockSmall(title1: "Sunrise", info1: "\(reInfo.data.sunrise)", title2: "Sunset", info2: "\(reInfo.data.sunset)", img: nil)
                    InfoBlockSmall(title1: "Wind", info1: "\(reInfo.data.win)", title2: "Wind Speed", info2: "\(reInfo.data.win_speed)", img: nil)
                }
                Spacer()
                Text("Country: \(reInfo.countryEn)    City ID: \(reInfo.cityid)   \nUpdate time: \(reInfo.update_time)")
                    .font(.caption)
            }
            .navigationBarTitle(Text("Chengdu"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct currentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        currentWeatherView()
    }
}
