//
//  ForecastListView.swift
//  TestNewsApp
//
//  Created by Admin on 25/07/2021.
//

import SwiftUI

struct ForecastListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(alignment:.top, spacing: 16){
                ForEach(ForecastReading.dummyData, id: \.time) { forecast in
                    ForecastView(forecast: forecast)
                }
            }
        })
    }
}

struct ForecastListView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastListView()
            .previewLayout(.sizeThatFits)
            .background(Color.black)
    }
}
