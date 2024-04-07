//
//  SourceViewModel.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import Foundation

final class SourceViewModel: ObservableObject {
    
    @Published var stories: [Story] = [
        Story(text: "1 story", image: "text.below.photo"),
        Story(text: "2 story", image: "text.below.photo"),
        Story(text: "3 story", image: "text.below.photo"),
        Story(text: "4 story", image: "text.below.photo"),
        Story(text: "5 story", image: "text.below.photo")
    ]
}
