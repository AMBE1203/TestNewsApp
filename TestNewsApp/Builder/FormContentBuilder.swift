//
//  FormContentBuilder.swift
//  TestNewsApp
//
//  Created by Admin on 14/06/2021.
//

import Foundation
import Combine

protocol FormContentBuilder {
    var content: [FormComponent] { get }
}

final class FormContentBuilderImpl:ObservableObject, FormContentBuilder {
    private(set) var content: [FormComponent] = [
        TextFormComponent(id: .firstName, placeHolder: "First name"),
        TextFormComponent(id: .lastName, placeHolder: "Last name"),
        TextFormComponent(id: .email, placeHolder: "Email", keyboardType: .emailAddress),
        DateComponent(id: .dob, mode: .date),
        ButtonComponent(id: .submit, title: "Confirm")

    ]
}
