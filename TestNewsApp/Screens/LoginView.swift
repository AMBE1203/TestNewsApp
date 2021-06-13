//
//  LoginView.swift
//  TestNewsApp
//
//  Created by Admin on 13/06/2021.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var contentBuilder = FormContentBuilderImpl()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 44))], spacing: 20) {
                
                ForEach(contentBuilder.content){ component in
                    switch component {
                    case is TextFormComponent:
                        TextFormFieldView(component: component as! TextFormComponent)
                    case is DateComponent:
                        DateFormView(component: component as! DateComponent)
                    case is ButtonComponent:
                        ButtonFormView(component: component as! ButtonComponent)
                    default:
                        EmptyView()
                    }
                    
                }
            }
            .padding(.top, 100)
            
        }.padding(.horizontal)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
