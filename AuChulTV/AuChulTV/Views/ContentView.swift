//
//  ContentView.swift
//  AuChulTV
//
//  Created by tae on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .edgesIgnoringSafeArea(.horizontal)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("Home")

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag("search")
        }
    }
}
