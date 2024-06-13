//
//  AppLauncher.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

enum AppState {
    case failed(ErrorType)
    case success
}

final class AppLauncher: Observable {
    enum LaunchState {
        case loading
    }
    
    var launchState = LaunchState.loading
    
    func load() {
        launchState = .loading
    }
}
