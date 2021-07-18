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
                .tabItem {
                    Text("城市列表")
                    Image(systemName: "list.dash")
                }
            LocalIndexView()
                .tabItem {
                    Text("本地指数")
                    Image(systemName: "building.2")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
