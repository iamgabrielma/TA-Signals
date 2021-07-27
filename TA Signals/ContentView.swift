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
                    Image(systemName: "checkmark.circle")
                    Text("Main")
            }
            TempEmptyView()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Empty")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
