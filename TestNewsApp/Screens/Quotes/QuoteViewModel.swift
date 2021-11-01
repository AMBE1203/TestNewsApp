//
//  QuoteViewModel.swift
//  TestNewsApp
//
//  Created by Admin on 01/11/2021.
//

import Foundation

protocol QuoteViewModel : ObservableObject {
    
    func getRandomQuotes() async
}

@MainActor
final class QuoteViewModelImpl : QuoteViewModel {
    
    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuoteService
    
    init(service: QuoteService){
        self.service = service
    }
    
    func getRandomQuotes() async {
        do {
            self.quotes = try await service.fetch()
        } catch {
            print(error)
        }
    }
    
    
}
