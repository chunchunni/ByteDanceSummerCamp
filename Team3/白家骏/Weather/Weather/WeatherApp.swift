//
//  WeatherApp.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/02.
//

import SwiftUI
import SwiftyJSON

enum HTTPRequestType {
    case GET
    case POST
}


class NetworkManager: AFHTTPSessionManager {
    static let shared = NetworkManager()
    func request(requestType: HTTPRequestType, urlString: String, parameters: [String: AnyObject]?, completion: @escaping (AnyObject?) -> ()) {
        let success = { (task: URLSessionDataTask, json: Any)->() in
            completion(json as AnyObject?)
        }
        let failure = { (task: URLSessionDataTask?, error: Error) -> () in
            print("Network request error: \(error)")
            completion(nil)
        }
        if requestType == .GET {
            get(urlString, parameters: parameters, success: success, failure: failure)
        } else {
            post(urlString, parameters: parameters, success: success, failure: failure)
        }
    }
}

class requestParameters {
    var appid: String = "63411561"
    var appsecret: String = "D1qFhLgW"
    var version: String = "v1"
    var city:String
    init(city: String) {
        self.city = city
    }
}
var requestParasDemo = requestParameters(city: "成都")

class returnInfosGeneral: ObservableObject {
    @Published var city: String = ""
    @Published var cityid: String = "00000"
    @Published var update_time: String = ""
    @Published var countryEn: String = ""
    @Published var data = datas()
    @Published var data1 = datas()
    @Published var data2 = datas()
    @Published var data3 = datas()
    @Published var data4 = datas()
    @Published var data5 = datas()
    class datas: ObservableObject {
        @Published var day: String = ""
        @Published var date: String = ""
        @Published var wea: String = ""
        @Published var wea_img: String = ""
        @Published var tem: String = ""
        @Published var tem1: String = ""
        @Published var tem2: String = ""
        @Published var win: String = ""
        @Published var win_speed: String = ""
        @Published var humidity: String = ""
        @Published var sunrise: String = ""
        @Published var sunset: String = ""
        @Published var visibility: String = ""
        @Published var pressure: String = ""
        @Published var air: String = ""
        @Published var air_level: String = ""
        @Published var air_tips: String = ""
        @Published var hours0 = hour()
        @Published var hours1 = hour()
        @Published var hours2 = hour()
        @Published var hours3 = hour()
        @Published var hours4 = hour()
        @Published var hours5 = hour()
        @Published var hours6 = hour()
        @Published var hours7 = hour()
        @Published var hours8 = hour()
        @Published var hours9 = hour()
        class hour: ObservableObject {
            @Published var hours: String = ""
            @Published var tem: String = ""
            @Published var wea_img: String = ""
        }
    }
}


class returnInfosBrief: ObservableObject {
    @Published var cityName: String = ""
    @Published var wea: String = ""
    @Published var tem: String = ""
}

class indexInfo: ObservableObject {
    @Published var cityName: String = ""
    @Published var desc: String = ""
    @Published var level: String = ""
    @Published var title: String = ""
}

let userCityList = UserDefaults.standard

struct defaultsKeys {
    static let cityList = "cityList"
}

@main
struct WeatherApp: App {
    init() {

    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
