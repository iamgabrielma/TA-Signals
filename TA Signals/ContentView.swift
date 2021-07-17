//
//  ContentView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 24/6/21.
//

import SwiftUI

/* The Stocks struct will hold the JSON data output
 *
 * Codable: To work with JSON objects
 * Identifiable: We'll work with unique tickers
 */
struct Stocks: Codable, Identifiable {

    var id: Int
    var ticker : String
    var rsi: String
    var signal: String
}

/*
 * ObservableObject: As our stocks variable needs to be updated right away (TODO: does it in this case?) when there's a change, we use the @Published property, this requires our class to follow ObservableObject protocol.
 */
class FetchStocks: ObservableObject {
    // 1. When the @Published property changes, a signal will be sent so the List within the ContentView is updated
    @Published var stocks = [Stocks]()
    // Classes in Swift do not have memberwise initializers ( like Structs do ) so we need to declare our own:
    
    init() {
        let url = URL(string: "https://raw.githubusercontent.com/iamgabrielma/Python-for-stock-market-analysis/main/testData/2021-06-25-rsi.json")!
        
        // 2. We create a task to retrieve the contents of the JSON file, we'll use the shared URLSession is a basic request that requires no further config:
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                // Question: I understand the "if let/else" is used to unwrap an optional, however there's no optional. The intention is the same though: If stockData contains data, decode it and dispatch it to the main thread queue. Otherwise return "no data".
                if let stockData = data {
                    // 3. The data is decoded to an array of Stock items and assigned to the stocks property.
                    let decodedData = try JSONDecoder().decode([Stocks].self, from: stockData)
                    // The task is added to the queue in the main thread of the current process, and will be executed immediately
                    DispatchQueue.main.async{
                        self.stocks = decodedData
                    }
                    print(stockData)
                } else {
                    print("No stock data")
                }
            } catch {
                print("Error")
            }
        }.resume() // Newly-initialized tasks begin in a suspended state, so you need to call this method to start the task
    }
}

struct ContentView: View {
    // 1. The fetch property will observe the FetchToDo class for changes
    @ObservedObject var fetchedObject = FetchStocks()
    
    let now = Date()
    
    private var isMarketOpen : Bool = false
    private var openOrClosed : String {
        if isMarketOpen == true {
            return "Open"
        } else {
            return "Closed"
        }
    }
    
    func test_styling(item: String) -> Text {
        
        var styledSignal : Text = Text(item).foregroundColor(.red)
        return styledSignal
    }
    
    func fetchUpdate() -> Void{
        // TODO: empty for now, fetched data + update "Text("Updated: 2021-06-25")" text
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
                    // 2. A list is created containing the todo items
                    List(fetchedObject.stocks) {stock in
                        VStack(alignment: .leading){
                            HStack(spacing: 25){
                                Text(stock.ticker)
                                //Divider()
                                Text(stock.rsi)
                                //Divider()
                                //Text(stock.signal)
                                (test_styling(item: stock.signal))
                            }
                            Divider()
                        }
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
