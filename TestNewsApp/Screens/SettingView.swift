//
//  SettingView.swift
//  TestNewsApp
//
//  Created by Admin on 13/06/2021.
//

import SwiftUI

struct SettingView: View {
    
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool

    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Display"),
                        footer: Text("System setting will override Dark mode and use the current device theme.")) {
                    Toggle(isOn: $darkModeEnabled, label: {
                        Text("Dark mode")
                    })
                    .onChange(of: darkModeEnabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    })
                    Toggle(isOn: $systemThemeEnabled, label: {
                        Text("Use system setting")
                    })
                    .onChange(of: darkModeEnabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    })
                }
                
                Section {
                    Link(destination: URL(string: Constants.facebook)!, label: {
                        Label("Follow me on Facebook", systemImage: "link")
                        
                        
                    })
                    
                    Link(destination: URL(string: Constants.email)!, label: {
                        Text("Contact me via email")
                    })
                    
                    Link(destination: URL(string:Constants.phone)!, label: {
                        Text("Call me")
                    })
                                        
                    
                }.foregroundColor(Theme.textColor)
                .font(.system(size: 16, weight: .semibold))
            }
            .navigationTitle("Settings")
            
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(darkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
    }
}
