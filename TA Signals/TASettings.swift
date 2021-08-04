//
//  TASettings.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 4/8/21.
//

import Foundation

class TASettings: ObservableObject {
    // Default: market is open unless Weekend.
    @Published var isMarketOpen = false
    
    static let dateNow = {
        return Date()
    }
    
    func marketChecker() -> Bool {
        // Checks if is weekend, in which case market is closed
        // TODO set to US timezone, and differentiate between market timezone and device timezone
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE yyyy-MM-dd"
        let outputDate = dateFormatter.string(from: date)
        if outputDate.contains("Saturday") || outputDate.contains("Sunday") {
            return false
        } else {
            return true
        }
    }
}
