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
                            .environmentObject(contentBuilder)
                    case is DateComponent:
                        DateFormView(component: component as! DateComponent)
                            .environmentObject(contentBuilder)
                    case is ButtonComponent:
                        ButtonFormView(component: component as! ButtonComponent) {id in
                            switch id {
                            case .submit:
                                // validate here
                                contentBuilder.validate()
                            default:
                                break
                            }
                        }
                    default:
                        EmptyView()
                    }
                    
                }
            }
            .padding(.top, 100)
            
        }.padding(.horizontal)
        .onChange(of: contentBuilder.state, perform: { state in
            switch state {
            case .valid(user: let user):
                print("Form is valid with user: \(user)")
            case .fail(error: let error):
                print("Failed: \(error.errorDescription)")
            case .none:
                break
            
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
