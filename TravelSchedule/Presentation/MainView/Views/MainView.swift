//
//  MainView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @EnvironmentObject var coordinator: BaseCoordinator
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @State var from: String = "Откуда"
    @State var to: String = "Куда"
    
    @State private var selectedStory: Story?
    
    private let rows = [GridItem()]
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            Color.YP.white.ignoresSafeArea()
            
            ScrollView {
                scrollWithStories
                    .padding(.top, 24)
                fromTo
                    .frame(height: 128)
                    .padding(.top, 44)
                
                if mainViewModel.selectedStationTo != nil
                    && mainViewModel.selectedStationFrom != nil {
                    searchButton
                        .onTapGesture {
                            print("Показать список")
                        }
                        .padding(.top, 16)
                }
                Spacer()
            }
            .scrollIndicators(.hidden)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Extension MainView

extension MainView {
    
    private var scrollWithStories: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: 12) {
                ForEach(mainViewModel.stories) { story in
                    StoryView(story: story, isNew: true)
                        .onTapGesture {
                            mainViewModel.selectedStory = story
                        }
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 144)
            .frame(maxWidth: .infinity)
        }
    }
    
    private var fromTo: some View {
        ZStack {
            blueRectangle
                .padding(.horizontal, 16)
            
            HStack {
                whiteRectangle
                    .padding(.leading, 32)
                SwitcherView
                    .padding(.trailing, 32)
            }
        }
    }
    
    private var blueRectangle: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.YP.blue)
            .frame(height: 128)
    }
    
    private var whiteRectangle: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.YP.whiteU)
            .frame(height: 96)
            .overlay(
                VStack(alignment: .leading, spacing: 28) {
                    selectionCityFromButton
                    selectingCityToButton
                }
            )
    }
    
    private var selectionCityFromButton: some View {
        
        Button {
            coordinator.selectingCityFrom()
        } label: {
            Text(mainViewModel.selectedStationFrom?.name == nil
                 ? from
                 : mainViewModel.selectedStationFrom?.name ?? ""
            )
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .font(.system(size: 17))
            .foregroundStyle(
                mainViewModel.selectedStationFrom?.name == nil
                ? Color.YP.gray
                : Color.YP.blackU
            )
            .lineLimit(1)
            .padding(.leading, 16)
            .padding(.trailing, 13)
        }
    }
    
    private var selectingCityToButton: some View {
        
        Button {
            coordinator.selectingCityTo()
        } label: {
            Text(mainViewModel.selectedStationTo?.name == nil
                 ? to
                 : mainViewModel.selectedStationTo?.name ?? ""
            )
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .font(.system(size: 17))
            .foregroundStyle(
                mainViewModel.selectedStationTo?.name == nil
                ? Color.YP.gray
                : Color.YP.blackU
            )
            .lineLimit(1)
            .padding(.leading, 16)
            .padding(.trailing, 13)
        }
    }
    
    private var SwitcherView: some View {
        Circle()
            .fill(Color.YP.whiteU)
            .frame(width: 36)
            .disabled((mainViewModel.selectedStationTo == nil) && (mainViewModel.selectedStationFrom == nil))
            .overlay(
                Image(systemName: "arrow.2.squarepath")
                    .foregroundStyle(Color.YP.blue)
                    .onTapGesture {
                        mainViewModel.switchStations()
                    }
            )
    }
    
    private var searchButton: some View {
        Button {
            coordinator.listOfCarriers()
        } label: {
            CustomButton(
                title: "Найти",
                isRedDot: false
            )
            .padding(.horizontal, 112)
        }
    }
}

// MARK: - Preview

#Preview {
    MainView()
}
