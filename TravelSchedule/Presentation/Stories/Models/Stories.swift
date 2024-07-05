//
//  Stories.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 03.07.2024.
//

import Foundation

struct Stories: Hashable, Identifiable {
    let id = UUID()
    let items: [Story]
    var isItShown: Bool
}
