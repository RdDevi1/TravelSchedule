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
    
    @State private var selectedTab = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.YP.white)
    }
    
    var body: some View {
        NavigationView {
                TabView(selection: $selectedTab) {
                    ZStack {
                        VStack(spacing: 0) {
                            MainView()
                            Divider()
                                .frame(height: 1)
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
                                .frame(height: 1)
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


#Preview {
    TabBarView()
}


//MARK: - Actions

private func switcStations() {
    //TODO: confirm
}
