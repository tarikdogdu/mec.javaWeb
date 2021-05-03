//
//  ContentView.swift
//  Practice
//
//  Created by Burhan Tarık Doğdu on 6.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MainView()
                .tabItem{
                    HStack{
                        Text("Main")
                        Image(systemName: "pencil.circle.fill")
                    }.accentColor(.orange)
                }
            MapView()
                .tabItem{
                    HStack{
                        Text("Map")
                        Image(systemName: "map")
                    }
                }
        }.accentColor(.orange)
        .animation(.easeIn(duration: 0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}
