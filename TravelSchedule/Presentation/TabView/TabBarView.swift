//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 03.03.2024.
//

import SwiftUI
import OpenAPIURLSession
import OpenAPIRuntime

struct TabBarView: View {
    
    @AppStorage("appTheme") private var isDarkModeOn = false
    
    @EnvironmentObject var coordinator: BaseCoordinator
    @StateObject var viewModel: TabBarViewModel
    @StateObject var mainViewModel = MainViewModel(stories: [], cities: [])
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedTab) {
                    ZStack {
                        VStack(spacing: 0) {
                            MainView()
                            Spacer()
                            Divider()
                        }
                    }
                    .tabItem {
                        Image(systemName: "arrow.up.message.fill")
                    }
                    .tag(0)
                    
                    ZStack {
                        VStack(spacing: 0) {
                            SettingsView(isDarkModeOn: $isDarkModeOn)
                            Divider()
                        }
                    }
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                    }
                    .tag(1)
                }
                .tint(Color.YP.black)
                .preferredColorScheme(isDarkModeOn ? .dark : .light)
            }
        }
    }
}


//#Preview {
//    TabBarView(viewModel: TabBarViewModel())
//}


//MARK: - Actions

private func switcStations() {
    //TODO: confirm
}
