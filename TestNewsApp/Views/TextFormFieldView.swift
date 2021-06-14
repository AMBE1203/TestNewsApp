//
//  TextFormFieldView.swift
//  TestNewsApp
//
//  Created by Admin on 13/06/2021.
//

import SwiftUI

struct TextFormFieldView: View {
    @EnvironmentObject var contentBuilder: FormContentBuilderImpl
    @State private var text = ""
    @State private var error: ValidationError?
    
    let component: TextFormComponent
    
    var body: some View {
        VStack (alignment:.leading){
            TextField(component.placeHolder, text:$text)
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                .padding(.leading, 5)
                .keyboardType(component.keyboardType)
                .background(RoundedRectangle(cornerRadius: 10).stroke(error == nil ? Color.gray.opacity(10) : Color.red))
            
            Text(error?.errorDescription ?? "")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.red)
        }.onChange(of: text, perform: { value in
            
            contentBuilder.update(text, in: component)
            error = component
                .validations
                .compactMap{  $0.validate(text)}
                .first
            
        })
        
    }
}

struct TextFormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFormFieldView(component: .init(id: .firstName, placeHolder: ""))
            .environmentObject(FormContentBuilderImpl())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
