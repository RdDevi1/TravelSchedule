//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import SwiftUI

struct SettingsView: View {

    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack {
            Toggle("Темная тема", isOn: $viewModel.isDarkMode)
                .toggleStyle(.switch)
                .padding()
                .tint(.YP.blue)
            
            HStack {
                Text("Пользовательское соглашение")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
            Spacer()
            Text("Приложение использует API Яндекс.Расписания")
                .font(.system(size: 12))
                
            Text("Версия .....")
                .font(.system(size: 12))
                .padding(10)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
