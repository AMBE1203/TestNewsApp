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
    func update(_ val: Any, in component: FormComponent)
    var state: FormState? {get}
    func validate()
}

final class FormContentBuilderImpl:ObservableObject, FormContentBuilder {
    
    @Published private(set) var state: FormState?
    
    private(set) var content: [FormComponent] = [
        TextFormComponent(id: .firstName, placeHolder: "First name", validations: [RegexValidationManagerImpl([
            RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid first name."))
        ])]),
        TextFormComponent(id: .lastName, placeHolder: "Last name", validations: [RegexValidationManagerImpl([
            RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid last name."))
        ])]),
        TextFormComponent(id: .email, placeHolder: "Email", keyboardType: .emailAddress, validations: [RegexValidationManagerImpl([
            RegexFormItem(pattern: RegexPatterns.emailChars, error: .custom(message: "Invalid  email missing @")),
            RegexFormItem(pattern: RegexPatterns.higherThanSixChars, error: .custom(message: "Less than 6 characters.."))
            
        ])]),
        DateComponent(id: .dob, mode: .date,  validations: [ DateValidationManagerImpl()]),
        ButtonComponent(id: .submit, title: "Confirm")
        
    ]
    
    func update(_ val: Any, in component: FormComponent) {
        guard let index = content.firstIndex(where: { $0.id == component.id
            
        }) else { return }
        
        content[index].val = val
    }
    
    func validate() {
        let formComponents = content.filter {
            $0.formId != .submit
        }
        
        for component in formComponents {
            for validator in component.validations {
                if let error = validator.validate(component.val as Any){
                    self.state = .fail(error: error)
                    return
                }
            }
        }
        
        if let firstName = formComponents.first(where: {$0.formId == .firstName })?.val as? String,
           let lastName = formComponents.first(where: {$0.formId == .lastName })?.val as? String,
           let email = formComponents.first(where: {$0.formId == .email })?.val as? String,
           let dob = formComponents.first(where: {$0.formId == .dob })?.val as? Date{
            let newUser = User(firstName: firstName, lastName: lastName, email: email, dob: dob)
            
            self.state = .valid(user: newUser)
        }
    }
}
