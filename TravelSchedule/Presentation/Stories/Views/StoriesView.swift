//
//  MainStoriesView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 16.06.2024.
//
import SwiftUI

struct MainStoriesView: View {
    
    // MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var storiesVM: StoriesViewModel
    
    // MARK: - Body
    
    var body: some View {
        switch storiesVM.state {
        case .failed(let error):
            ErrorView(error: error)
        case .success:
            successView
        }
    }
}

// MARK: Extension MainStoriesView

extension MainStoriesView {
    private var successView: some View {
        Color.YP.blackU
            .ignoresSafeArea()
            .overlay {
                TabView(
                    selection: $storiesVM.selectedStoriesIndex
                ) {
                    ForEach(0..<StoriesViewModel.stories.count, id: \.self) { index in
                        TabStoriesView(
                            storiesForOneUser: StoriesViewModel.stories[storiesVM.selectedStoriesIndex].items,
                            actionForFinishStories: {
                                if index == StoriesViewModel.stories.count - 1 {
                                    StoriesViewModel.stories[index].isItShown = true
                                    storiesVM.selectedStoriesIndex = index
                                    closeView()
                                } else {
                                    storiesVM.selectedStoriesIndex = index + 1
                                    StoriesViewModel.stories[index].isItShown = true
                                }
                            }, actionForCloseButton: {
                                StoriesViewModel.stories[index].isItShown = true
                                closeView()
                            })
                    }
                }
                .ignoresSafeArea()
                .tabViewStyle(
                    PageTabViewStyle(
                        indexDisplayMode: .never
                    )
                )
            }
    }
    
    private func closeView() {
        presentationMode.wrappedValue.dismiss()
    }
    
    private var closeButton: some View {
        HStack {
            Spacer()
            Button(action: {
                closeView()
            }, label: {
                Image("closeButton")
                    .resizable()
                    .frame(
                        width: 30,
                        height: 30
                    )
            }
            )
            .padding(.top, 50)
            .padding(.trailing, 12)
        }
    }
}
