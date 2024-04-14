//
//  TabBarViewModel.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import Foundation

final class TabBarViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var state = TabBarState.success
    
    
    enum TabBarState {
        case loading
        case failed(ErrorType)
        case success
    }
   
    func setTabBarState(stat: TabBarState = .success) {
        self.state = stat
    }
    
    func fetchData() {
    }
}
