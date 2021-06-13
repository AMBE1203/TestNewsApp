//
//  SystemThemeManager.swift
//  TestNewsApp
//
//  Created by Admin on 13/06/2021.
//

import Foundation
import UIKit

class SystemThemeManager {
    static let shared = SystemThemeManager()
    
    private init(){
        
    }
    
    func handleTheme(darkMode: Bool, system: Bool){
        
        // hande system
        guard !system else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
            return
        }
        
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
        
    }
    
    
}
