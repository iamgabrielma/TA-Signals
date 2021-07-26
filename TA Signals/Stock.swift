//
//  Stock.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 26/7/21.
//

import Foundation
/*
 * The Stocks struct will hold the JSON data output. Conforms to Codable and Identifiable protocols in order to work properly with JSON objects
 */
struct Stock: Codable, Identifiable {

    var id: Int
    var ticker : String
    // TODO: https://github.com/iamgabrielma/TA-Signals/issues/4
    var rsi: String
    var ema100: String
    var ema200: String
    var signal: String
}
