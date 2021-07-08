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
    var appsecret: String = "iMuuM8O3"
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
    class datas: ObservableObject {
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
        @Published var hours = [hour](repeating: returnInfosGeneral.datas.hour(), count: 8)
        class hour: ObservableObject {
            @Published var hours: String = ""
            @Published var tem: String = ""
            @Published var wea_img: String = ""
        }
    }
}
var returnInfo = returnInfosGeneral()

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

        returnInfo.data.hours[0].hours = json["data"][0]["hours"][0]["hours"].string ?? ""
        returnInfo.data.hours[0].tem = json["data"][0]["hours"][0]["tem"].string ?? ""
        returnInfo.data.hours[0].wea_img = json["data"][0]["hours"][0]["wea_img"].string ?? ""
        returnInfo.data.hours[1].hours = json["data"][0]["hours"][1]["hours"].string ?? ""
        returnInfo.data.hours[1].tem = json["data"][0]["hours"][1]["tem"].string ?? ""
        returnInfo.data.hours[1].wea_img = json["data"][0]["hours"][1]["wea_img"].string ?? ""
        returnInfo.data.hours[2].hours = json["data"][0]["hours"][2]["hours"].string ?? ""
        returnInfo.data.hours[2].tem = json["data"][0]["hours"][2]["tem"].string ?? ""
        returnInfo.data.hours[2].wea_img = json["data"][0]["hours"][2]["wea_img"].string ?? ""
        returnInfo.data.hours[3].hours = json["data"][0]["hours"][3]["hours"].string ?? ""
        returnInfo.data.hours[3].tem = json["data"][0]["hours"][3]["tem"].string ?? ""
        returnInfo.data.hours[3].wea_img = json["data"][0]["hours"][3]["wea_img"].string ?? ""
        returnInfo.data.hours[4].hours = json["data"][0]["hours"][4]["hours"].string ?? ""
        returnInfo.data.hours[4].tem = json["data"][0]["hours"][4]["tem"].string ?? ""
        returnInfo.data.hours[4].wea_img = json["data"][0]["hours"][4]["wea_img"].string ?? ""
        returnInfo.data.hours[5].hours = json["data"][0]["hours"][5]["hours"].string ?? ""
        returnInfo.data.hours[5].tem = json["data"][0]["hours"][5]["tem"].string ?? ""
        returnInfo.data.hours[5].wea_img = json["data"][0]["hours"][5]["wea_img"].string ?? ""
        returnInfo.data.hours[6].hours = json["data"][0]["hours"][6]["hours"].string ?? ""
        returnInfo.data.hours[6].tem = json["data"][0]["hours"][6]["tem"].string ?? ""
        returnInfo.data.hours[6].wea_img = json["data"][0]["hours"][6]["wea_img"].string ?? ""
        returnInfo.data.hours[7].hours = json["data"][0]["hours"][7]["hours"].string ?? ""
        returnInfo.data.hours[7].tem = json["data"][0]["hours"][7]["tem"].string ?? ""
        returnInfo.data.hours[7].wea_img = json["data"][0]["hours"][7]["wea_img"].string ?? ""

        for i in 0...7 {
            print("hour \(i).hours = \(returnInfo.data.hours[i].hours)")
            print("hour \(i).tem = \(returnInfo.data.hours[i].tem)")
        }
        print("hour 2.hours = \(returnInfo.data.hours[2].hours)")
        print("hour 1.tem = \(returnInfo.data.hours[1].tem)")
        print("hour 4.wea_imgs = \(returnInfo.data.hours[4].wea_img)")
        print("cityid = \(returnInfo.cityid)")
    }
}

//var returnInfo = requestData(requestParas: requestParasDemo)

@main
struct WeatherApp: App {
    init() {
        requestData(requestParas: requestParasDemo)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
