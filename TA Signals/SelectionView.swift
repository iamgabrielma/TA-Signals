//
//  TempEmptyView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 27/7/21.
//

import SwiftUI

struct SelectionView: View {
    
    @StateObject var appSettings = TASettings()
    
    var body: some View {
        // TODO: repeated code, I can move this to AppConstants or TASettings:
        let marketStatus = appSettings.isMarketOpen ? "Open 🟢" : "Closed 🔴"
        
        TabView{
            NavigationView{
                VStack{
                    Text("Hello. Market is \(marketStatus)")
                }
                .navigationTitle("TA Signals - Empty View")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct TempEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
