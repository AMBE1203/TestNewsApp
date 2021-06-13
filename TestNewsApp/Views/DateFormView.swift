//
//  DateFormView.swift
//  TestNewsApp
//
//  Created by Admin on 13/06/2021.
//

import SwiftUI

struct DateFormView: View {
    let component: DateComponent
    
    var body: some View {
        VStack(alignment: .leading){
            DatePicker("", selection: .constant(Date()),
                       displayedComponents: [component.mode])
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment:.leading)
            
            Text("Error here")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.red)
        }
    }
}

struct DateFormView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormView(component: .init(id: .dob, mode: .date)).previewLayout(.sizeThatFits).padding()
    }
}
