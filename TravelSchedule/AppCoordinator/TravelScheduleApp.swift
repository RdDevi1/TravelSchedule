//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

@main
struct TravelSchedule: App {
   
    @State private var launcher = AppLauncher()
    @Environment(\.scenePhase)var scenePhase
    @ObservedObject var coordinator = BaseCoordinator()
    @StateObject var mainViewModel: MainViewModel = MainViewModel(cities: [])
    @StateObject var storiesViewModel = StoriesViewModel()
    
    var body: some Scene {
        WindowGroup {
            bodyContentView(
                launchState: AppLauncher.LaunchState.loading
            )
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .active {
                print("Active")
            } else if newPhase == .background {
                print("Background")
            }
        }
    }
    
    @ViewBuilder
    private func bodyContentView(
        launchState: AppLauncher.LaunchState
    ) -> some View {
        
        NavigationStack(path: $coordinator.path) {
            ZStack {
                appContent()
                    .sheet(item: $coordinator.presentSheetItem) { present in
                        ViewFactory.viewForDestination(present)
                    }
                    .fullScreenCover(item: $coordinator.fullCoverItem) { present in
                        ViewFactory.viewForDestination(present)
                    }
            }
            .navigationDestination(for: DestinationFlowPage.self) { destination in
                ViewFactory.viewForDestination(destination)
            }
        }
        .environmentObject(coordinator)
        .environmentObject(mainViewModel)
        .environmentObject(storiesViewModel)
    }
    
    @ViewBuilder func appContent() -> some View {
        ViewFactory.getTabBar()
    }
}
