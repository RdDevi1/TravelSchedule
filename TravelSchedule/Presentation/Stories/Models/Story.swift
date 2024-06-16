//
//  Model.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.06.2024.
//

import Foundation

struct Stories: Hashable, Identifiable {
    var id = UUID()
    var items: [Story]
    var isItShown: Bool
}

struct Story: Hashable, Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var subTitle: String
}
