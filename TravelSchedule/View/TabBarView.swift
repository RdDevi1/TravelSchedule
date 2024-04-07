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
    @State private var selectedTab = 0
    
    var body: some View {
            VStack {
                TabView(selection: $selectedTab) {
//                    ZStack {
                        VStack(spacing: 0) {
                            MainView()
                            Spacer()
                            Divider()
                        }
//                    }
                    .tabItem {
                        Image(systemName: "arrow.up.message.fill")
                    }
                    .tag(0)
                    
//                    ZStack {
                        VStack(spacing: 0) {
                            SettingsView()
                            Divider()
                        }
//                    }
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                    }
                    .tag(1)
                }
                .tint(Color.black)
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
