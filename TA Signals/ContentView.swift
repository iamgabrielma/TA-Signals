//
//  ContentView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 24/6/21.
//

import SwiftUI

struct ContentView: View {
    // 1. The fetch property will observe the FetchToDo class for changes
    @State var fetchedObject = StocksDataFetcher()
    @State var showFetchDetails : Bool = false
    @State var isMarketOpen : Bool = true
    let now = Date()
    
    // TODO: https://github.com/iamgabrielma/TA-Signals/issues/5
    func openOrClosed(b : Bool) -> String{
        if (b){
            return "open"
        } else {
            return "closed"
        }
    }
    
    func fetchUpdate() -> Void{
        // TODO: https://github.com/iamgabrielma/TA-Signals/issues/7
        showFetchDetails.toggle()
    }
    
    var body: some View {
        // TODO: https://github.com/iamgabrielma/TA-Signals/issues/1
        NavigationView{
                VStack {
                    // TODO: https://github.com/iamgabrielma/TA-Signals/issues/2
                    Button("Fetch", action: fetchUpdate).font(.title2).padding()
                    Text("Market is \(openOrClosed(b: isMarketOpen))").font(.caption)
                    Text("Now: \(now, style: .date)").font(.caption)
                    Text("Last Fetch: June 25, 2021").font(.caption)
                    
                    if showFetchDetails {
                        // 2. A list is created containing the todo items
                        List(fetchedObject.stocks) { stock in
                            StockListCell(stock: stock)
                        }
                        Text("This is not financial or investment advice. The Content is for informational purposes only.").font(.caption)
                    }
                }
                .navigationTitle("TA Signals")
                .navigationBarTitleDisplayMode(.inline)
            }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
