//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.04.2024.
//

import Foundation


final class SettingsViewModel: ObservableObject {
    
    @Published var isDarkMode: Bool = false 
   
    init() {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    }
    
    func upDateUserDefaults(newValue: Bool){
        UserDefaults.standard.set(newValue, forKey: "isDarkMode")
    }

}
