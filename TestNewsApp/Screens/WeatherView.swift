//
//  WeatherView.swift
//  TestNewsApp
//
//  Created by Admin on 20/07/2021.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        
        List {
            HourlyForecastView()
                .listRowInsets(EdgeInsets())
            
        }
        .padding()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
