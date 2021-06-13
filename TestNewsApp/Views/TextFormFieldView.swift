//
//  TextFormFieldView.swift
//  TestNewsApp
//
//  Created by Admin on 13/06/2021.
//

import SwiftUI

struct TextFormFieldView: View {
    
    let component: TextFormComponent
    
    var body: some View {
        VStack (alignment:.leading){
            TextField(component.placeHolder, text:.constant(""))
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                .padding(.leading, 5)
                .keyboardType(component.keyboardType)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(10)))
            
            Text("Error here")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.red)
        }    }
}

struct TextFormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFormFieldView(component: .init(id: .firstName, placeHolder: "")).previewLayout(.sizeThatFits).padding()
    }
}
