//
//  ContentView.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 24/6/21.
//

import SwiftUI

// The Codable struct, this should allow me to fetch JSON and convert it into a Swift object to work with.
struct Stocks: Codable, Identifiable {
    
    //var id: Int // Added by the fixer when I used the Identifiable protocol. TODO: Reasearch more. If I take this off, I see the previous error in ContentView and the build fails.
    
    //var ticker: String
    var id: Int
    var ticker : String
    var rsi: String
    var signal: String
}


class FetchStocks: ObservableObject {
    // 1. when the published property will be changed, a signal will be send which will update the List in the ContentView.
    @Published var stocks = [Stocks]()
    
    init() {
        let url = URL(string: "https://raw.githubusercontent.com/iamgabrielma/Python-for-stock-market-analysis/main/testData/2021-06-25-rsi.json")!
        
        // 2. A task is created which retrieves the contents of the json file
        // Receives response data into memory rather than downloading + storing into the file system (URLSessionDownloadTask)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let stockData = data {
                    // 3. The data is decoded to an array of Stock items and assigned to the stocks property.
                    let decodedData = try JSONDecoder().decode([Stocks].self, from: stockData)
                    DispatchQueue.main.async{
                        // Back to the main thread
                        self.stocks = decodedData
                    }
                    print(stockData)
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume() // Newly-initialized tasks begin in a suspended state, so you need to call this method to start the task
    }
}

struct ContentView: View {
    // 1. The fetch property will observe the FetchToDo class for changes
    @ObservedObject var fetch = FetchStocks()
    
    // We declare the structure where we want to load the JSON into, in this case an array of Stock objects
    //var stocks = [Stocks]()
    
    var body: some View {
        Text("Hello!")
        VStack {
            // 2. A list is created containing the todo items
            List(fetch.stocks) {stock in
                VStack(alignment: .leading){
                    Text(stock.ticker) // ticker
                    Text(stock.rsi)
                    Text(stock.signal)
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
