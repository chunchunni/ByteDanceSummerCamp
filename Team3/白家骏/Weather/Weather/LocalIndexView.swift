//
//  weatherQualityView.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/02.
//

import SwiftUI
import SwiftyJSON

struct LocalIndexView: View {
    @ObservedObject var returnIndexInfo0 = indexInfo()
    @ObservedObject var returnIndexInfo1 = indexInfo()
    @ObservedObject var returnIndexInfo2 = indexInfo()
    @ObservedObject var returnIndexInfo3 = indexInfo()
    @ObservedObject var returnIndexInfo4 = indexInfo()
    
    var body: some View {
        NavigationView {
            List {
                localIndexView(desc: returnIndexInfo0.desc, level: returnIndexInfo0.level, title: returnIndexInfo0.title)
                localIndexView(desc: returnIndexInfo1.desc, level: returnIndexInfo1.level, title: returnIndexInfo1.title)
                localIndexView(desc: returnIndexInfo2.desc, level: returnIndexInfo2.level, title: returnIndexInfo2.title)
                localIndexView(desc: returnIndexInfo3.desc, level: returnIndexInfo3.level, title: returnIndexInfo3.title)
                localIndexView(desc: returnIndexInfo4.desc, level: returnIndexInfo4.level, title: returnIndexInfo4.title)
                Text("定位城市： \(returnIndexInfo0.cityName)")
            }
            .onAppear(perform: requestData)
            .navigationBarTitle("本地指数")
        }
    }
    
    func requestData() {
        let manager = NetworkManager()
        var requestParas = requestParameters(city: "")
        manager.request(requestType: .GET, urlString: "https://tianqiapi.com/api", parameters: ["appid": requestParas.appid as AnyObject, "appsecret": requestParas.appsecret as AnyObject, "version": requestParas.version as AnyObject]) { (data) in
            
            let json = try! JSON(data)
            returnIndexInfo0.cityName = json["city"].string ?? ""
            returnIndexInfo0.desc = json["data"][0]["index"][0]["desc"].string ?? ""
            returnIndexInfo0.level = json["data"][0]["index"][0]["level"].string ?? ""
            returnIndexInfo0.title = json["data"][0]["index"][0]["title"].string ?? ""
            
            returnIndexInfo1.desc = json["data"][0]["index"][1]["desc"].string ?? ""
            returnIndexInfo1.level = json["data"][0]["index"][1]["level"].string ?? ""
            returnIndexInfo1.title = json["data"][0]["index"][1]["title"].string ?? ""
            
            returnIndexInfo2.desc = json["data"][0]["index"][2]["desc"].string ?? ""
            returnIndexInfo2.level = json["data"][0]["index"][2]["level"].string ?? ""
            returnIndexInfo2.title = json["data"][0]["index"][2]["title"].string ?? ""
            
            returnIndexInfo3.desc = json["data"][0]["index"][3]["desc"].string ?? ""
            returnIndexInfo3.level = json["data"][0]["index"][3]["level"].string ?? ""
            returnIndexInfo3.title = json["data"][0]["index"][3]["title"].string ?? ""
            
            returnIndexInfo4.desc = json["data"][0]["index"][4]["desc"].string ?? ""
            returnIndexInfo4.level = json["data"][0]["index"][4]["level"].string ?? ""
            returnIndexInfo4.title = json["data"][0]["index"][4]["title"].string ?? ""
        }
    }
}

struct LocalIndexView_Previews: PreviewProvider {
    static var previews: some View {
        LocalIndexView()
    }
}
