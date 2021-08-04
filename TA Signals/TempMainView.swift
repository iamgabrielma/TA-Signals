//
//  TempMainView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 27/7/21.
//

import SwiftUI

struct TempMainView: View {
    
    // 1. The fetch property will observe the FetchToDo class for changes
    @State var fetchedObject = StocksDataFetcher()
    @State var showFetchDetails = false
    //@State var isMarketOpen = true
    //@State var openOrClosed = false
    
    let now = Date()

    func fetchUpdate() -> Void{
        // TODO: https://github.com/iamgabrielma/TA-Signals/issues/7
//        if !openOrClosed {
//            print("TODO: If market is closed just toggle and show old data")
//        } else {
//            print("TODO: If market is open, check if there's new data to pull")
//        }
        //showFetchDetails.toggle()
    }
    
    var body: some View {
        TabView{
            // TODO: https://github.com/iamgabrielma/TA-Signals/issues/1
            NavigationView{
                    VStack {
                        VStack{
                            // TODO: https://github.com/iamgabrielma/TA-Signals/issues/2
                            Button("Fetch", action: fetchUpdate).font(.title2).padding()
                            //Text("Market is \(openOrClosed ? "Open" : "Closed")").font(.caption)
                            Text("Market is ...")
                            Text("Now: \(now, style: .date)").font(.caption)
                            Text("Last Fetch: June 25, 2021").font(.caption)
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
