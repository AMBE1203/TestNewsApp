//
//  ResultState.swift
//  TestNewsApp
//
//  Created by Admin on 10/06/2021.
//

import Foundation

enum ResultState : Equatable {
    
    case loading
    case success(content: [Article])
    case failed(error: Error)
    
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.failed(error:let lhsType), .failed(error:let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        case (.success(content: let lhs), .success(content: let rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
    
}
