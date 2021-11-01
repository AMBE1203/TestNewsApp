//
//  QuoteService.swift
//  TestNewsApp
//
//  Created by Admin on 06/09/2021.
//

import Foundation

protocol QuoteService {
    func fetch() async throws -> [Quote]

}

final class QuoteServiceImpl : QuoteService {
    func fetch() async throws -> [Quote] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstans.baseUrl.appending("/api/quotes"))
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([Quote].self, from: data)
    }
    
}
