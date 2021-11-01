//
//  ForecastReading.swift
//  TestNewsApp
//
//  Created by Admin on 25/07/2021.
//

import Foundation

struct ForecastReading {
    let time: String
    let symbol: String
    let temp: Double
}

extension ForecastReading {
    static let dummyData = [
        ForecastReading(time: "Now", symbol: "sun.max.fill", temp: 108),
        ForecastReading(time: "6 AM", symbol: "sun.max.fill", temp: 108),
        ForecastReading(time: "7 AM", symbol: "sun.max.fill", temp: 200),
        ForecastReading(time: "8 AM", symbol: "sun.max.fill", temp: 188),
        ForecastReading(time: "8:33 AM", symbol: "cloud.sun.fill", temp: 32),
        ForecastReading(time: "9 AM", symbol: "cloud.sun.fill", temp: 89),
        ForecastReading(time: "10 AM", symbol: "cloud.sun.fill", temp: 90),

    ]
}
