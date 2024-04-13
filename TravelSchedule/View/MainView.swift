//
//  MainView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = SourceViewModel()
    
    @State private var isSearchButtonHidden = true
    @State private var isTabBarHidden = false
    @State private var from: String = "Откуда"
    @State private var to: String = "Куда"
    
    private let rows = [GridItem()]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: 12) {
                ForEach(viewModel.stories) { story in
                    StoryView(story: story)
                }
            }
            .frame(height: 144)
            .padding()
        }
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(
                    width: UIScreen.main.bounds.width - 32,
                    height: 128
                )
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(
                        width: UIScreen.main.bounds.width - 100,
                        height: 96
                    )
                    .overlay(
                        VStack(alignment: .leading, spacing: 28) {
                            NavigationLink {
                                //     SelectionView(typeOfSelection: .city)
                            } label: {
                                Text(from)
                                    .frame(
                                        width: UIScreen.main.bounds.width - 132,
                                        alignment: .leading
                                    )
                                    .font(.system(size: 17))
                                    .foregroundStyle(Color.gray)
                                    .lineLimit(1)
                            }
                            NavigationLink {
                                //     SelectionView(typeOfSelection: .station)
                            } label: {
                                Text(to)
                                    .frame(
                                        width: UIScreen.main.bounds.width - 132,
                                        alignment: .leading
                                    )
                                    .font(.system(size: 17))
                                    .foregroundStyle(Color.gray)
                                    .lineLimit(1)
                            }
                        }
                    )
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 36)
                    .overlay(
                        Image(systemName: "arrow.2.squarepath")
                            .foregroundStyle(Color.blue)
                            .onTapGesture {
                                didTapSwitchStations()
                            }
                    )

            }
        }
        .padding()
        Spacer()
    }
    
    private func didTapSwitchStations() {
        let newTo = from
        from = to
        to = newTo
    }
    
}

#Preview {
    MainView()
}

