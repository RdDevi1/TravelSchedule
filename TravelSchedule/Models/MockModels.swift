//
//  MockModels.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import Foundation

struct Story: Hashable, Identifiable {
    var id = UUID()
    var images: [String]
    var title: String
    var subTitle: String
}

struct City: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var stations: [Station]
}

struct Station: Hashable, Identifiable {
    var id = UUID()
    var name: String
}
