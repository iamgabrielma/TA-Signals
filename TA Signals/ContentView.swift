//
//  ContentView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 24/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appSettings : TASettings
    
    var body: some View {
        
        TabView{
            MainView()
                .tabItem {
                    Image(systemName: "house") // * SF symbols
                    Text("Main")
            }
            SelectionView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Selection")
            }
            SettingsView()
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
