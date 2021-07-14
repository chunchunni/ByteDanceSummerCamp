//
//  CityListView.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/14.
//

import SwiftUI
import SwiftyJSON

struct CityListView: View {
    @State private var isAddItemViewPresented = false
    @State private var cityNameList = ["北京", "成都"]
    
    var body: some View {
        NavigationView {
            VStack {
                List(cityNameList.indices, id: \.self) { index in
                    NavigationLink(destination: currentWeatherView(cityName: cityNameList[index])) {
                        CityListUnit(cityName: cityNameList[index])
                    }
                }
                .navigationBarTitle("City List", displayMode: .automatic)
                .navigationBarItems(trailing: Button(action: {isAddItemViewPresented = true}, label: {
                    Image(systemName: "plus")
                }).sheet(isPresented: self.$isAddItemViewPresented, content: {
                    AddItemView(isPresented: $isAddItemViewPresented, cityNameList: $cityNameList)
                }))
            }
           
           
        }
    }
}

struct AddItemView: View {
    @State var newCityName = ""
    @Binding var isPresented: Bool
    @Binding var cityNameList: [String]
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Enter the new city name:")
                        .font(.title2)
                    Spacer()
                }
                TextField("", text: $newCityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(cityNameList.indices, id: \.self) { index in
                    CityListUnit(cityName: cityNameList[index])
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Add New City", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                if self.newCityName != "" {
                    cityNameList.append(newCityName)
                    newCityName = ""
                }
                for item in cityNameList {
                    print(item)
                }
                self.isPresented = false
            }, label: {
                Text("Done")
            }))
        }
    }
}

struct CityListUnit: View {
    var cityName: String
    @State var wea: String = ""
    @State var tem: String = ""
    
    var body: some View {
        HStack {
            Text(cityName)
            Spacer()
            Text(wea)
            Text(tem)
        }
        .onAppear(perform: {
            requestInfoBrief(cityName: cityName)
        })
        .padding()
    }
    
    func requestInfoBrief(cityName: String) {
        let manager = NetworkManager()
        var requestParas = requestParameters(city: cityName)
        //var returnInfo = returnInfosBrief()
        manager.request(requestType: .GET, urlString: "https://tianqiapi.com/api", parameters: ["appid": requestParas.appid as AnyObject, "appsecret": requestParas.appsecret as AnyObject, "version": requestParas.version as AnyObject, "city": requestParas.city as AnyObject]) { (data) in
            
            let json = try! JSON(data)
            self.wea = json["data"][0]["wea"].string ?? ""
            self.tem = json["data"][0]["tem"].string ?? ""
            print(cityName)
            print(tem)
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}
