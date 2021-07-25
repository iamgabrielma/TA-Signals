//
//  ContentView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 24/6/21.
//

import SwiftUI

/*
 * The Stocks struct will hold the JSON data output. Conforms to Codable and Identifiable protocols in order to work properly with JSON objects
 */
struct Stocks: Codable, Identifiable {

    var id: Int
    var ticker : String
    var rsi: String
    var ema100: String
    var ema200: String
    var signal: String
}

struct ContentView: View {
    // 1. The fetch property will observe the FetchToDo class for changes
    @State var fetchedObject = FetchStocks()
    @State var showFetchDetails : Bool = false
    //@ObservedObject var fetchedObject = FetchStocks()
    // Change to how data is pulled:I'm not positive I need an @ObservedObject here, as we'll pulling the data on "Fetch". This is on purpose as I'll only make the data available on daily ( or so ) intervals.
    let now = Date()
    
    private var isMarketOpen : Bool = false
    private var openOrClosed : String {
        if isMarketOpen {
            return "Open"
        } else {
            return "Closed"
        }
    }
    
    func test_styling(item: String, type: String) -> Text {
        
        var styledSignal : Text = Text(item)
        
        if type == "signal" {
            styledSignal = Text(item).foregroundColor(.red)
        }
        else if type == "rsi" {
            //styledSignal = Text("\(item, specifier:"%.2f")")
            // --> cutting down the decimals here doesn't work, but I'll want to do the calculation in the backe-end anyway.
            styledSignal = Text("RSI: \(item)" as String)
        }
        else {
            styledSignal = Text(item)
        }
        
        return styledSignal
    }
    
    func fetchUpdate() -> Void{
        // TODO: empty for now, fetched data + update "Text("Updated: 2021-06-25")" text
        showFetchDetails.toggle()
    }
    
    // We declare the structure where we want to load the JSON into, in this case an array of Stock objects
    //var stocks = [Stocks]()
    
    var body: some View {
        NavigationView{
            //ScrollView(.vertical){ TODO: --> Adding ScrollView doesn't fetch data
                VStack {
                    Button("Fetch", action: fetchUpdate).font(.title2).padding()
                    Text("Market is \(openOrClosed)").font(.caption)
                    //Image(systemName: "task")
                    Text("Now: \(now, style: .date)").font(.caption)
                    Text("Last Fetch: June 25, 2021").font(.caption)
                    if showFetchDetails {
                        // 2. A list is created containing the todo items

                        //Section(header: Text("header")){
                        //Text("Header outside the list")
                        
                        List(fetchedObject.stocks) { stock in
                            VStack(alignment: .leading){
                                HStack(spacing: 25){
                                    Text(stock.ticker)
                                    //Divider()
                                    //Text(stock.rsi)
                                    //(test_styling(item: stock.rsi, type: "rsi"))
                                    //Divider()
                                    //Text(stock.signal)
                                    // Adding more fields as part of the JSON data that we'll be displaying:
                                    (test_styling(item: stock.signal, type: "signal"))
                                    VStack(){
                                        (test_styling(item: stock.rsi, type: "rsi"))
                                        Text("EMA100: \(stock.ema100)")
                                        Text("EMA200: \(stock.ema200)")
                                    }
                                    
                                }
                                Divider()
                            }
                        }// <!-- List
                        Text("This is not financial or investment advice. The Content is for informational purposes only.").font(.caption)
                    //} //! -- Section && Text attempt

                    }
                }
                .navigationTitle("TA Signals")
                .navigationBarTitleDisplayMode(.inline)
            }
        //}
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
