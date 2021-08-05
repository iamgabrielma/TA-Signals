//
//  TA_SignalsTests.swift
//  TA SignalsTests
//
//  Created by Gabriel Maldonado Almendra on 24/6/21.
//

import XCTest
@testable import TA_Signals

class TA_SignalsTests: XCTestCase {
    
    func test_fetch_base_url(){
        
        let url = AppConstants.baseURL
        let expectedURL = "https://raw.githubusercontent.com/iamgabrielma/Python-for-stock-market-analysis/main/testData/"
        
        XCTAssertEqual(url, expectedURL)
        
    }
    
    func test_if_market_open() throws {
        
        let appSettings = TASettings()
        let isMarketOpen = {
            return appSettings.isMarketOpen
        }
        // Skip test if market is closed, as will fail:
        try XCTSkipIf(!isMarketOpen(), "Skipping test, market is closed.")
        XCTAssertEqual(isMarketOpen(), true)

    }
    
    func test_if_market_closed() throws {
        
        let appSettings = TASettings()
        let isMarketOpen = {
            return appSettings.isMarketOpen
        }
        // Skip test if market is open, as will fail:
        try XCTSkipIf(isMarketOpen(), "Skipping test, market is open.")
        XCTAssertEqual(isMarketOpen(), false)

    }

// WIP
//    func test_json(){
//
//
//    let stockDataFetcher = StocksDataFetcher()
//    let response = stockDataFetcher.stocks.isEmpty
//    XCTAssertEqual(response, false) // Fails, isEmpty = true . init value before fetching data?
//
//    }

}
