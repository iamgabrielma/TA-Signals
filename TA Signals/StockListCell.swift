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
        GeometryReader { gp in
            VStack(alignment: .leading){
                HStack(spacing: 25){
                    // Width: 20% for Ticker and Signal, 60% for RSI+EMA
                    Text(stock.ticker).frame(width: gp.size.width * 0.2)
                    Text(stock.signal).frame(width: gp.size.width * 0.2)
                    VStack(){
                        Text("RSI: \(stock.rsi)").frame(alignment: .center)//.frame(width: gp.size.width * 0.3)
                        Text("EMA100: \(stock.ema100)").frame(alignment: .center)//.frame(width: gp.size.width * 0.3)
                        Text("EMA200: \(stock.ema200)").frame(alignment: .center)//.frame(width: gp.size.width * 0.3)
                    }
                }.frame(height: gp.size.height)
                Divider()
            }
        } // <-- VStack
    } // <-- GeometryReader
}

struct StockListCell_Previews: PreviewProvider {
    static var previews: some View {
        
        StockListCell(stock: Stock(id: 0, ticker: "NONE", rsi: "0", ema100: "0", ema200: "0", signal: "Neutral"))
    }
}
