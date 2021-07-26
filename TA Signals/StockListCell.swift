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
                Text(stock.signal)
                VStack(){
                    Text("RSI: \(stock.rsi)")
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
        
        StockListCell(stock: Stock(id: 0, ticker: "NONE", rsi: "0", ema100: "0", ema200: "0", signal: "Neutral"))
    }
}
