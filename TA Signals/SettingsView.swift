//
//  TempSettingsView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 27/7/21.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var appSettings = TASettings()
    
    var body: some View {
        
        // TODO: DRY
        let marketStatus = appSettings.isMarketOpen ? "Open 🟢" : "Closed 🔴"
        let now = TASettings.dateNow
        
        TabView{
            NavigationView{
                VStack{
                    // TODO: DRY
                    Text("Hello. Market is \(marketStatus)")
                    Text("Now: \(now(), style: .date)").font(.caption)
                    Text("Now (UTC):")
                    Text("Last Fetch: \(AppConstants.lastFetch)").font(.caption)
                }
                .navigationTitle("TA Signals - Settings")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct TempSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
