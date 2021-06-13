//
//  ButtonFormView.swift
//  TestNewsApp
//
//  Created by Admin on 14/06/2021.
//

import SwiftUI

struct ButtonFormView: View {
    
    let component: ButtonComponent
    var body: some View {
        Button(component.title) {
            
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
        ButtonFormView(component: .init(id: .submit, title: "")).previewLayout(.sizeThatFits).padding()
    }
}
