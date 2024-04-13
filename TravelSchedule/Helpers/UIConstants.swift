//
//  UIConstants.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.04.2024.
//

import Foundation

enum UIConstants: CaseIterable {
    
    case TextField
    case Button
    case Image
    case CheckBox
    
    var height: CGFloat {
        switch self {
        case .TextField:
            return 50
            
        case .Button:
            return 50
            
        case .Image:
            return 200
            
        case .CheckBox:
            return 24
        }
    }
}
