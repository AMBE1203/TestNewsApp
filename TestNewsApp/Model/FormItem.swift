//
//  FormItem.swift
//  TestNewsApp
//
//  Created by Admin on 14/06/2021.
//

import Foundation
import UIKit
import SwiftUI

/*
 Uniqe enum for my form
 */

enum FormField {
    case firstName
    case lastName
    case email
    case dob
    case submit
    
}
/*
 Implementation for form item
 */

protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var val: Any? { get }
}

/*
 Base form component
 */

class FormComponent : FormItem, Identifiable {
    var formId: FormField
    let id = UUID()
    var val: Any?
    
    init(_ id: FormField) {
        self.formId = id
    }
}

/**
 Text component
 */

final class TextFormComponent : FormComponent {
    let placeHolder: String
    let keyboardType: UIKeyboardType
    
    init(id: FormField,
         placeHolder: String,
         keyboardType: UIKeyboardType = .default) {
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
        super.init(id)
    }
    
}

/**
 Date component
 */

final class DateComponent : FormComponent {
    let mode: DatePickerComponents
    
    init(id: FormField,
         mode: DatePickerComponents) {
        self.mode = mode
        super.init(id)
    }
}

/**
 Button  component
 */

final class ButtonComponent : FormComponent {
    let title: String
    init(id: FormField,
         title: String) {
        self.title = title
        super.init(id)
    }
}
