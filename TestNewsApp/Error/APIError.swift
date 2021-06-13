//
//  APIError.swift
//  TestNewsApp
//
//  Created by Admin on 10/06/2021.
//

import Foundation

enum APIError : Error {
    case decodingError
    case errorCode(Int)
    case unknow
}

extension APIError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Fail to decode the object from the service"
        case .errorCode(let code):
            return "\(code) something went wrong"
        case .unknow:
            return "The error is unknow"
            
        }
    }
}
