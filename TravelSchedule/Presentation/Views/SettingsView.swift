//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isDarkModeOn: Bool
    @StateObject var viewModel = SettingsViewModel()
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        
        switch viewModel.state {
        case .failed(let error):
            ErrorView(error: error)
        case .success:
            ZStack {
                Color.YP.white.ignoresSafeArea()
                VStack {
                    HStack {
                        Toggle(isOn: $isDarkModeOn, label: {
                            Text("Тёмная тема")
                                .foregroundStyle(Color.YP.black)
                                .font(.system(size: 17))
                        })
                        .tint(.blue)
                    }
                    .padding(.horizontal, 16)
                    
                    SelectionCell(
                        action: {
                            if let url = URL(string: Constants.userAgreement)  {
                                openURL(url)
                            }
                        },
                        title: "Пользовательское соглашение"
                    )
                    
                    Spacer()
                    
                    VStack(spacing: 16) {
                        Text("Приложение использует API «Яндекс.Расписания»")
                            .foregroundStyle(Color.YP.black)
                            .font(.system(size: 12))
                        Text("Версия .......")
                            .foregroundStyle(Color.YP.black)
                            .font(.system(size: 12))
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 24)
            }
        }
    }
}
