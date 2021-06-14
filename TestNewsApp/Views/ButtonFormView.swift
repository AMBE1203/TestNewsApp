//
//  ButtonFormView.swift
//  TestNewsApp
//
//  Created by Admin on 14/06/2021.
//

import SwiftUI

struct ButtonFormView: View {

    
    typealias ButtonActionHandler = (_ formId: FormField) -> Void
    
    let component: ButtonComponent
    let handler: ButtonActionHandler
    
    
    init(component: ButtonComponent, handler: @escaping ButtonFormView.ButtonActionHandler) {
        self.component = component
        self.handler = handler
    }
    
    
    var body: some View {
        Button(component.title) {
            handler(component.formId )
        }
        .frame(maxWidth:.infinity, minHeight: 44, alignment: .center)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .bold))
            .cornerRadius(10)
    }
}

struct ButtonFormView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFormView(component: .init(id: .submit, title: ""))
            {_ in}
            .previewLayout(.sizeThatFits).padding()
    }
}
