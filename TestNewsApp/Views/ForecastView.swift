//
//  ForecastView.swift
//  TestNewsApp
//
//  Created by Admin on 25/07/2021.
//

import SwiftUI

struct ForecastView: View {
    
    let forecast: ForecastReading
    
    var body: some View {
        VStack(spacing: 12) {
            Text(forecast.time)
                .font(.system(size: 12, weight: .bold))
            Image(systemName: forecast.symbol)
                .renderingMode(.original)
            Text(format(temp: forecast.temp))
                .font(.system(size: 16, weight: .medium))
        }
        .foregroundColor(.white)
    }
    
    private func format(temp: Double) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .temperatureWithoutUnit
        let tempInDegress = Measurement(value: temp, unit: UnitTemperature.celsius)
        
        return formatter.string(from: tempInDegress)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(forecast: ForecastReading.dummyData.first!)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
