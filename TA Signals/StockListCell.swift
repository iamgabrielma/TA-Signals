//
//  StockListCell.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 26/7/21.
//

import SwiftUI

// Single Stock View
struct StockListCell: View {
    
    let stock : Stock
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 25){
                Text(stock.ticker)
                //(test_styling(item: stock.signal, type: "signal"))
                VStack(){
                    //(test_styling(item: stock.rsi, type: "rsi"))
                    Text("EMA100: \(stock.ema100)")
                    Text("EMA200: \(stock.ema200)")
                }
            }
            Divider()
        }
    }
}

struct StockListCell_Previews: PreviewProvider {
    static var previews: some View {
        // 1 - Error: From what I understand here, I should pass the instance of Stock() but is throwing: Missing argument for parameter 'from' in call. Is it expecting the JSOn decoder?
        // 2- Seems I need to pass 1 stock like: StockListCell(stock: Stock(id: T##Int, ticker: T##String, rsi: T##String, ema100: T##String, ema200: T##String, signal: T##String)), is it because it needs and initializer, and I have not set default values in the struct declaration?
        StockListCell(stock: Stock(id: 0, ticker: "none", rsi: "0", ema100: "0", ema200: "0", signal: "None"))
    }
}
