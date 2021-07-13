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
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Group {
                                InfoBlockHori(hours: reInfo.data.hours0.hours, tem: reInfo.data.hours0.tem, wea_img: UIImage(named: reInfo.data.hours0.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours1.hours, tem: reInfo.data.hours1.tem, wea_img: UIImage(named: reInfo.data.hours1.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours2.hours, tem: reInfo.data.hours2.tem, wea_img: UIImage(named: reInfo.data.hours2.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours3.hours, tem: reInfo.data.hours3.tem, wea_img: UIImage(named: reInfo.data.hours3.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours4.hours, tem: reInfo.data.hours4.tem, wea_img: UIImage(named: reInfo.data.hours4.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours5.hours, tem: reInfo.data.hours5.tem, wea_img: UIImage(named: reInfo.data.hours5.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours6.hours, tem: reInfo.data.hours6.tem, wea_img: UIImage(named: reInfo.data.hours6.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours7.hours, tem: reInfo.data.hours7.tem, wea_img: UIImage(named: reInfo.data.hours7.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours8.hours, tem: reInfo.data.hours8.tem, wea_img: UIImage(named: reInfo.data.hours8.wea_img))
                                InfoBlockHori(hours: reInfo.data.hours9.hours, tem: reInfo.data.hours9.tem, wea_img: UIImage(named: reInfo.data.hours9.wea_img))
                            }
                        }
                    }

                    Group {
                        InfoBlockFuture(day: reInfo.data1.day, wea: reInfo.data1.wea, tem1: reInfo.data1.tem1, tem2: reInfo.data1.tem2)
                        InfoBlockFuture(day: reInfo.data2.day, wea: reInfo.data2.wea, tem1: reInfo.data2.tem1, tem2: reInfo.data2.tem2)
                        InfoBlockFuture(day: reInfo.data3.day, wea: reInfo.data3.wea, tem1: reInfo.data3.tem1, tem2: reInfo.data3.tem2)
                        InfoBlockFuture(day: reInfo.data4.day, wea: reInfo.data4.wea, tem1: reInfo.data4.tem1, tem2: reInfo.data4.tem2)
                        InfoBlockFuture(day: reInfo.data5.day, wea: reInfo.data5.wea, tem1: reInfo.data5.tem1, tem2: reInfo.data5.tem2)
                    }
                    
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
