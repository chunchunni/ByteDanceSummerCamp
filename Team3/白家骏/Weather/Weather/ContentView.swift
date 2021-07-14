//
//  ContentView.swift
//  Weather
//
//  Created by Bill Haku on 2021/07/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CityListView()
                .tabItem { Text("City List") }
            weatherQualityView()
                .tabItem { Text("Air Quality") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
