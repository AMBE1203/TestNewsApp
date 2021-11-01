//
//  HomeView.swift
//  TestNewsApp
//
//  Created by Admin on 10/06/2021.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false

    
    var body: some View {
        
        TabView {
            FeedView()
                .tabItem { Image(systemName: "newspaper")
                    Text("Feed")
                }
            
            SettingView(darkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled).tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            
            LoginView()
                .tabItem { Image(systemName: "person.fill")
                    Text("Login")
                }
            WeatherView()
                .tabItem { Image(systemName: "sunrise")
                    Text("Weather")
                }
            QuotesScreen()
                .tabItem { Image(systemName: "sunrise")
                    Text("Quotes")
                }
        }
        .onAppear {
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
        }
        
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
