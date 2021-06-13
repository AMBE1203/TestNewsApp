//
//  RegexPatterns.swift
//  TestNewsApp
//
//  Created by Admin on 14/06/2021.
//

import Foundation

enum RegexPatterns {
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
}
