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
    var appsecret: String = "PC8rKEI9"
    var version: String = "v1"
    var city:String
    init(city: String) {
        self.city = city
    }
}
var requestParasDemo = requestParameters(city: "成都")

class returnInfosGeneral {
    var city: String = ""
    var cityid: String = "00000"
    var update_time: String = ""
    var country: String = ""
    var data = datas()
    class datas {
        var wea: String = ""
        var wea_img: String = ""
        var tem: String = ""
        var tem1: String = ""
        var tem2: String = ""
        var win: String = ""
        var win_speed: String = ""
        var humidity: String = ""
        var sunrise: String = ""
        var sunset: String = ""
        var visibility: String = ""
        var pressure: String = ""
        var air: String = ""
        var air_level: String = ""
        var air_tips: String = ""
    }
}


func requestData(requestParas: requestParameters) -> returnInfosGeneral {
    let manager = NetworkManager()
    var returnInfoGeneral = returnInfosGeneral()
    //manager.responseSerializer.acceptableContentTypes = NSSet(object: "text/html") as! Set<String>
    manager.request(requestType: .GET, urlString: "https://tianqiapi.com/api", parameters: ["appid": requestParas.appid as AnyObject, "appsecret": requestParas.appsecret as AnyObject, "version": requestParas.version as AnyObject, "city": requestParas.city as AnyObject]) { (data) in
        //print(data)
        
        let json = try! JSON(data)
        returnInfoGeneral.city = json["city"].string ?? ""
        returnInfoGeneral.cityid = json["cityid"].string ?? ""
        returnInfoGeneral.update_time = json["update_time"].string ?? ""
        returnInfoGeneral.country = json["country"].string ?? ""
        returnInfoGeneral.data.wea = json["data"][0]["wea"].string ?? ""
        returnInfoGeneral.data.wea_img = json["data"][0]["wea_img"].string ?? ""
        returnInfoGeneral.data.tem = json["data"][0]["tem"].string ?? ""
        returnInfoGeneral.data.tem1 = json["data"][0]["tem1"].string ?? ""
        returnInfoGeneral.data.tem2 = json["data"][0]["tem2"].string ?? ""
        returnInfoGeneral.data.win = json["data"][0]["win"].string ?? ""
        returnInfoGeneral.data.win_speed = json["data"][0]["win_speed"].string ?? ""
        returnInfoGeneral.data.humidity = json["data"][0]["humidity"].string ?? ""
        returnInfoGeneral.data.sunset = json["data"][0]["sunset"].string ?? ""
        returnInfoGeneral.data.sunrise = json["data"][0]["sunrise"].string ?? ""
        returnInfoGeneral.data.visibility = json["data"][0]["visibility"].string ?? ""
        returnInfoGeneral.data.pressure = json["data"][0]["pressure"].string ?? ""
        returnInfoGeneral.data.air = json["data"][0]["air"].string ?? ""
        returnInfoGeneral.data.air_tips = json["data"][0]["air_tips"].string ?? ""
        returnInfoGeneral.data.air_level = json["data"][0]["air_level"].string ?? ""
        print("cityid = \(returnInfoGeneral.cityid)")
        print("wea = \(returnInfoGeneral.data.wea)")
    }
    return returnInfoGeneral
}

var returnInfo = requestData(requestParas: requestParasDemo)

@main
struct WeatherApp: App {
    init() {
        returnInfo = requestData(requestParas: requestParasDemo)
        print("returnInfo.cityid = \(returnInfo.cityid)")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
