//
//  FetchStocks.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 25/7/21.
//

import Foundation
/*
 * ObservableObject: As our stocks variable needs to be updated right away (TODO: does it in this case?) when there's a change, we use the @Published property, this requires our class to follow ObservableObject protocol.
 */


class StocksDataFetcher {
    // 1. When the @Published property changes, a signal will be sent so the List within the ContentView is updated
    // The variable stocks contains an array of Stock objects
    @Published var stocks = [Stock]()
    
    var _feature_flag_json_includes_date: Bool = false
    
    // Classes in Swift do not have memberwise initializers ( like Structs do ) so we need to declare our own:
    init() {
        
        var url = URL(string: "https://raw.githubusercontent.com/iamgabrielma/Python-for-stock-market-analysis/main/testData/2021-06-25-rsi.json")!
        if _feature_flag_json_includes_date {
            url = URL(string: "https://raw.githubusercontent.com/iamgabrielma/Python-for-stock-market-analysis/main/testData/2021-07-27-rsi.json")!
        }

        
        // 2. We create a task to retrieve the contents of the JSON file, we'll use the shared URLSession is a basic request that requires no further config:
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                // Question: I understand the "if let/else" is used to unwrap an optional, however there's no optional. The intention is the same though: If stockData contains data, decode it and dispatch it to the main thread queue. Otherwise return "no data".
                if let stockData = data {
                    // 3. The data is decoded to an array of Stock items and assigned to the stocks property.
                    let decodedData = try JSONDecoder().decode([Stock].self, from: stockData)
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
