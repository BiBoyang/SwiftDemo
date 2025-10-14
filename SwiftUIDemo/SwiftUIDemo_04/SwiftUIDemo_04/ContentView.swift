//
//  ContentView.swift
//  SwiftUIDemo_04
//
//  Created by Boyang on 2025/10/14.
//

import SwiftUI

enum Tabs:String {
    case home,profile,setting,search
}


struct ContentView: View {
    @State var selectedTab : Tabs = .home
    @State var searchString = "Hi"
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Tab("Home", systemImage: "house",value: .home) {
                Color.green.ignoresSafeArea()
            }
            Tab("Profile", systemImage: "person",value: .profile) {
                Color.orange.ignoresSafeArea()
            }
            Tab("Setting", systemImage: "gearshape",value: .profile) {
                Color.blue.ignoresSafeArea()
            }
            Tab(value: .search, role: .search) {
                NavigationStack{
                    List{
                        Text("Search screen")
                    }
                    .navigationTitle("Search")
                    .searchable(text: $searchString)
                }
            }
        }
        .tabViewBottomAccessory {
            Text(selectedTab.rawValue)
        }
    }
}

#Preview {
    ContentView()
}
