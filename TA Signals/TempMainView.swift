//
//  TempMainView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 27/7/21.
//

import SwiftUI

struct TempMainView: View {
    
    @StateObject var appSettings = TASettings()
    
    // 1. The fetch property will observe the FetchToDo class for changes
    @State var fetchedObject = StocksDataFetcher()
    @State var showFetchDetails = false

    func fetchUpdate() -> Void{
        // TODO: https://github.com/iamgabrielma/TA-Signals/issues/7
    }
    
    var body: some View {
        
        let marketStatus = appSettings.isMarketOpen ? "Open 🟢" : "Closed 🔴"
        let now = TASettings.dateNow
        let lastFetch = AppConstants.lastFetch
        // Not being used right now:
        //let marketStatusCheck = appSettings.marketChecker()
        
        TabView{
            // TODO: https://github.com/iamgabrielma/TA-Signals/issues/1
            NavigationView{
                    VStack {
                        VStack{
                            // TODO: https://github.com/iamgabrielma/TA-Signals/issues/2
                            Button("Fetch", action: fetchUpdate).font(.title2).padding()
                            Text("Market is \(marketStatus)")
                            Text("Now: \(now(), style: .date)").font(.caption)
                            Text("Last Fetch: \(lastFetch)").font(.caption)
                            List(fetchedObject.stocks) { stock in
                                StockListCell(stock: stock)
                            }
                        }
                        .navigationTitle("TA Signals")
                        .navigationBarTitleDisplayMode(.inline)
                        
                        VStack{
                            Text("This is not financial or investment advice. The Content is for informational purposes only.").font(.caption)
                        }

                    }
            }.onAppear(perform: fetchUpdate) // I do not need the initial fetch screen, just to call fetchUpdate as soon as the View loads.
        }
    }
}

struct TempMainView_Previews: PreviewProvider {
    static var previews: some View {
        TempMainView()
    }
}
