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
            currentWeatherView()
                .tabItem { Text("Current") }
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
