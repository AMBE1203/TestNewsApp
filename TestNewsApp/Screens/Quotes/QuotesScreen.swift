//
//  QuotesScreen.swift
//  TestNewsApp
//
//  Created by Admin on 25/08/2021.
//

import SwiftUI

struct QuotesScreen: View {
    
    @StateObject private var vm  = QuoteViewModelImpl(service: QuoteServiceImpl())
    
    var body: some View {
        
        Group {
            if vm.quotes.isEmpty {
                VStack(spacing: 8){
                    ProgressView()
                    Text("Loading..")
                }
                
            } else {
                List {
                    ForEach(vm.quotes, id: \.anime){ item in
                        QuoteView(item: item)
                        
                    }
                }
            }
        }
     .task {
            await vm.getRandomQuotes()
        }
    }
    
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
