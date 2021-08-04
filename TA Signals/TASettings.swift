//
//  TASettings.swift
//  TA Signals
//
//  Created by Gabriel Maldonado Almendra on 4/8/21.
//

import Foundation

class TASettings: ObservableObject {
    // default: market is closed
    @Published var isMarketOpen = false
}
