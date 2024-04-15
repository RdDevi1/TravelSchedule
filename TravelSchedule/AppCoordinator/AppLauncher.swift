//
//  AppLauncher.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

final class AppLauncher: Observable {
    enum LaunchState {
        case loading
    }
    
    var launchState = LaunchState.loading
    
    func load() {
        launchState = .loading
    }
}
