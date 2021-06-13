//
//  NewsViewModel.swift
//  TestNewsApp
//
//  Created by Admin on 10/06/2021.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
    var isLoading: Bool {
        get
    }
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service : NewsService
    
    private(set) var articles = [Article]()
    private var cancellable = Set<AnyCancellable>()
    
    @Published private(set) var state : ResultState = .loading
    
    var isLoading: Bool {
        state == .loading
    }
    
    init(service : NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service.request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    // send back the articles
                    self.state = .success(content: self.articles)
                case .failure(let code):
                    // send back the error
                    self.state = .failed(error: code)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        self.cancellable.insert(cancellable)
        
    }
    
}
