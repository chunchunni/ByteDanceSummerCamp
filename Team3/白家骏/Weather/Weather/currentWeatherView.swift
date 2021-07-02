//
//  currentWeatherView.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/02.
//

import SwiftUI

struct currentWeatherView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("City ID: \(returnInfo.cityid)")
                Text("Country: \(returnInfo.country)")
                Text(returnInfo.update_time)
            }
            .navigationBarTitle(Text("Chengdu"))
        }
    }
}

struct currentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        currentWeatherView()
    }
}
