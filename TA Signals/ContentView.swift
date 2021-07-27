//
//  ContentView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 24/6/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView{
            TempMainView()
                .tabItem {
                    Image(systemName: "house") // * SF symbols
                    Text("Main")
            }
            TempEmptyView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Empty")
            }
            TempSettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
