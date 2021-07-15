//
//  currentWeatherView.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/02.
//

import SwiftUI
import SwiftyJSON

struct currentWeatherView: View {
    var cityName: String
    @ObservedObject var returnInfo = returnInfosGeneral()
    //lazy var requestPara = requestParameters(city: cityName)
    var body: some View {
        VStack {
            List {
                Group {
                    InfoBlock(title: "天气", info: "\(returnInfo.data.wea)", img: nil, tips: nil)
                    InfoBlock(title: "实时温度", info: "\(returnInfo.data.tem)", img: nil, tips: nil)
                    InfoBlock(title: "温度范围", info: "\(returnInfo.data.tem2) ~ \(returnInfo.data.tem1)", img: nil, tips: nil)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Group {
                                InfoBlockHori(hours: returnInfo.data.hours0.hours, tem: returnInfo.data.hours0.tem, wea_img: UIImage(named: returnInfo.data.hours0.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours1.hours, tem: returnInfo.data.hours1.tem, wea_img: UIImage(named: returnInfo.data.hours1.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours2.hours, tem: returnInfo.data.hours2.tem, wea_img: UIImage(named: returnInfo.data.hours2.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours3.hours, tem: returnInfo.data.hours3.tem, wea_img: UIImage(named: returnInfo.data.hours3.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours4.hours, tem: returnInfo.data.hours4.tem, wea_img: UIImage(named: returnInfo.data.hours4.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours5.hours, tem: returnInfo.data.hours5.tem, wea_img: UIImage(named: returnInfo.data.hours5.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours6.hours, tem: returnInfo.data.hours6.tem, wea_img: UIImage(named: returnInfo.data.hours6.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours7.hours, tem: returnInfo.data.hours7.tem, wea_img: UIImage(named: returnInfo.data.hours7.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours8.hours, tem: returnInfo.data.hours8.tem, wea_img: UIImage(named: returnInfo.data.hours8.wea_img))
                                InfoBlockHori(hours: returnInfo.data.hours9.hours, tem: returnInfo.data.hours9.tem, wea_img: UIImage(named: returnInfo.data.hours9.wea_img))
                            }
                        }
                    }

                    Group {
                        InfoBlockFuture(day: returnInfo.data1.day, wea: returnInfo.data1.wea, tem1: returnInfo.data1.tem1, tem2: returnInfo.data1.tem2)
                        InfoBlockFuture(day: returnInfo.data2.day, wea: returnInfo.data2.wea, tem1: returnInfo.data2.tem1, tem2: returnInfo.data2.tem2)
                        InfoBlockFuture(day: returnInfo.data3.day, wea: returnInfo.data3.wea, tem1: returnInfo.data3.tem1, tem2: returnInfo.data3.tem2)
                        InfoBlockFuture(day: returnInfo.data4.day, wea: returnInfo.data4.wea, tem1: returnInfo.data4.tem1, tem2: returnInfo.data4.tem2)
                        InfoBlockFuture(day: returnInfo.data5.day, wea: returnInfo.data5.wea, tem1: returnInfo.data5.tem1, tem2: returnInfo.data5.tem2)
                    }
                    
                    InfoBlock(title: "湿度", info: "\(returnInfo.data.humidity)", img: nil, tips: nil)
                    InfoBlock(title: "空气质量", info: "(AQI) \(returnInfo.data.air)   \(returnInfo.data.air_level)", img: nil, tips: "空气质量提示： \(returnInfo.data.air_tips)")
                    InfoBlock(title: "能见度", info: "\(returnInfo.data.visibility)", img: nil, tips: nil)
                    InfoBlockSmall(title1: "日出", info1: "\(returnInfo.data.sunrise)", title2: "日落", info2: "\(returnInfo.data.sunset)", img: nil)
                    InfoBlockSmall(title1: "风向", info1: "\(returnInfo.data.win)", title2: "风速", info2: "\(returnInfo.data.win_speed)", img: nil)
                }
                Spacer()
                Text("Country: \(returnInfo.countryEn)    City ID: \(returnInfo.cityid)   \nUpdate time: \(returnInfo.update_time)")
                    .font(.caption)
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text(cityName), displayMode: .inline)
        }
        .onAppear(perform: {
            requestData(requestParas: requestParameters(city: cityName))
        })
        //.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func requestData(requestParas: requestParameters) {
        let manager = NetworkManager()
        //var returnInfoGeneral = returnInfosGeneral()
        //manager.responseSerializer.acceptableContentTypes = NSSet(object: "text/html") as! Set<String>
        manager.request(requestType: .GET, urlString: "https://tianqiapi.com/api", parameters: ["appid": requestParas.appid as AnyObject, "appsecret": requestParas.appsecret as AnyObject, "version": requestParas.version as AnyObject, "city": requestParas.city as AnyObject]) { (data) in
            //print(data)
            
            let json = try! JSON(data)
            returnInfo.city = json["city"].string ?? ""
            returnInfo.cityid = json["cityid"].string ?? ""
            returnInfo.update_time = json["update_time"].string ?? ""
            returnInfo.countryEn = json["countryEn"].string ?? ""
            returnInfo.data.wea = json["data"][0]["wea"].string ?? ""
            returnInfo.data.wea_img = json["data"][0]["wea_img"].string ?? ""
            returnInfo.data.tem = json["data"][0]["tem"].string ?? ""
            returnInfo.data.tem1 = json["data"][0]["tem1"].string ?? ""
            returnInfo.data.tem2 = json["data"][0]["tem2"].string ?? ""
            returnInfo.data.win = json["data"][0]["win"][0].string ?? ""
            returnInfo.data.win_speed = json["data"][0]["win_speed"].string ?? ""
            returnInfo.data.humidity = json["data"][0]["humidity"].string ?? ""
            returnInfo.data.sunset = json["data"][0]["sunset"].string ?? ""
            returnInfo.data.sunrise = json["data"][0]["sunrise"].string ?? ""
            returnInfo.data.visibility = json["data"][0]["visibility"].string ?? ""
            returnInfo.data.pressure = json["data"][0]["pressure"].string ?? ""
            returnInfo.data.air = json["data"][0]["air"].string ?? ""
            returnInfo.data.air_tips = json["data"][0]["air_tips"].string ?? ""
            returnInfo.data.air_level = json["data"][0]["air_level"].string ?? ""
            
            returnInfo.data1.day = json["data"][1]["day"].string ?? ""
            returnInfo.data1.wea = json["data"][1]["wea"].string ?? ""
            returnInfo.data1.tem1 = json["data"][1]["tem1"].string ?? ""
            returnInfo.data1.tem2 = json["data"][1]["tem2"].string ?? ""
            returnInfo.data2.day = json["data"][2]["day"].string ?? ""
            returnInfo.data2.wea = json["data"][1]["wea"].string ?? ""
            returnInfo.data2.tem1 = json["data"][2]["tem1"].string ?? ""
            returnInfo.data2.tem2 = json["data"][2]["tem2"].string ?? ""
            returnInfo.data3.day = json["data"][3]["day"].string ?? ""
            returnInfo.data3.wea = json["data"][1]["wea"].string ?? ""
            returnInfo.data3.tem1 = json["data"][3]["tem1"].string ?? ""
            returnInfo.data3.tem2 = json["data"][3]["tem2"].string ?? ""
            returnInfo.data4.day = json["data"][4]["day"].string ?? ""
            returnInfo.data4.wea = json["data"][1]["wea"].string ?? ""
            returnInfo.data4.tem1 = json["data"][4]["tem1"].string ?? ""
            returnInfo.data4.tem2 = json["data"][4]["tem2"].string ?? ""
            returnInfo.data5.day = json["data"][5]["day"].string ?? ""
            returnInfo.data5.wea = json["data"][1]["wea"].string ?? ""
            returnInfo.data5.tem1 = json["data"][5]["tem1"].string ?? ""
            returnInfo.data5.tem2 = json["data"][5]["tem2"].string ?? ""
            
            returnInfo.data.hours0.hours = json["data"][0]["hours"][0]["hours"].string ?? ""
            returnInfo.data.hours0.tem = json["data"][0]["hours"][0]["tem"].string ?? ""
            returnInfo.data.hours0.wea_img = json["data"][0]["hours"][0]["wea_img"].string ?? ""
            returnInfo.data.hours1.hours = json["data"][0]["hours"][1]["hours"].string ?? ""
            returnInfo.data.hours1.tem = json["data"][0]["hours"][1]["tem"].string ?? ""
            returnInfo.data.hours1.wea_img = json["data"][0]["hours"][1]["wea_img"].string ?? ""
            returnInfo.data.hours2.hours = json["data"][0]["hours"][2]["hours"].string ?? ""
            returnInfo.data.hours2.tem = json["data"][0]["hours"][2]["tem"].string ?? ""
            returnInfo.data.hours2.wea_img = json["data"][0]["hours"][2]["wea_img"].string ?? ""
            returnInfo.data.hours3.hours = json["data"][0]["hours"][3]["hours"].string ?? ""
            returnInfo.data.hours3.tem = json["data"][0]["hours"][3]["tem"].string ?? ""
            returnInfo.data.hours3.wea_img = json["data"][0]["hours"][3]["wea_img"].string ?? ""
            returnInfo.data.hours4.hours = json["data"][0]["hours"][4]["hours"].string ?? ""
            returnInfo.data.hours4.tem = json["data"][0]["hours"][4]["tem"].string ?? ""
            returnInfo.data.hours4.wea_img = json["data"][0]["hours"][4]["wea_img"].string ?? ""
            returnInfo.data.hours5.hours = json["data"][0]["hours"][5]["hours"].string ?? ""
            returnInfo.data.hours5.tem = json["data"][0]["hours"][5]["tem"].string ?? ""
            returnInfo.data.hours5.wea_img = json["data"][0]["hours"][5]["wea_img"].string ?? ""
            returnInfo.data.hours6.hours = json["data"][0]["hours"][6]["hours"].string ?? ""
            returnInfo.data.hours6.tem = json["data"][0]["hours"][6]["tem"].string ?? ""
            returnInfo.data.hours6.wea_img = json["data"][0]["hours"][6]["wea_img"].string ?? ""
            returnInfo.data.hours7.hours = json["data"][0]["hours"][7]["hours"].string ?? ""
            returnInfo.data.hours7.tem = json["data"][0]["hours"][7]["tem"].string ?? ""
            returnInfo.data.hours7.wea_img = json["data"][0]["hours"][7]["wea_img"].string ?? ""
            returnInfo.data.hours8.hours = json["data"][0]["hours"][8]["hours"].string ?? ""
            returnInfo.data.hours8.tem = json["data"][0]["hours"][8]["tem"].string ?? ""
            returnInfo.data.hours8.wea_img = json["data"][0]["hours"][8]["wea_img"].string ?? ""
            returnInfo.data.hours9.hours = json["data"][0]["hours"][9]["hours"].string ?? ""
            returnInfo.data.hours9.tem = json["data"][0]["hours"][9]["tem"].string ?? ""
            returnInfo.data.hours9.wea_img = json["data"][0]["hours"][9]["wea_img"].string ?? ""
            
            /*
            for i in 0...7 {
                /*
                returnInfo.data.hourUnit.hours = json["data"][0]["hours"][i]["hours"].string ?? ""
                returnInfo.data.hourUnit.tem = json["data"][0]["hours"][i]["tem"].string ?? ""
                returnInfo.data.hourUnit.wea_img = json["data"][0]["hours"][i]["wea_img"].string ?? ""
                returnInfo.data.hours.append(returnInfo.data.hourUnit)
                */
                
                returnInfo.data.hours[i]?.hours = json["data"][0]["hours"][i]["hours"].string ?? ""
                returnInfo.data.hours[i]?.tem = json["data"][0]["hours"][i]["tem"].string ?? ""
                returnInfo.data.hours[i]?.wea_img = json["data"][0]["hours"][i]["wea_img"].string ?? ""
                
            }
            
            for i in 0...7 {
                print("hour \(i).hours = \(returnInfo.data.hours[i]?.hours)")
                print("hour \(i).tem = \(returnInfo.data.hours[i]?.tem)")
            }
            print("hour 2.hours = \(returnInfo.data.hours[2]?.hours)")
            print("hour 1.tem = \(returnInfo.data.hours[1]?.tem)")
            print("hour 4.wea_imgs = \(returnInfo.data.hours[4]?.wea_img)")
            */
            print("cityid = \(returnInfo.cityid)")
        }
    }
}

struct currentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        currentWeatherView(cityName: "成都")
    }
}
