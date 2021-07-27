//
//  TempSettingsView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 27/7/21.
//

import SwiftUI

struct TempSettingsView: View {
    var body: some View {
        TabView{
            NavigationView{
                VStack{
                    Text("Hello")
                }
                .navigationTitle("TA Signals - Settings")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct TempSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        TempSettingsView()
    }
}
