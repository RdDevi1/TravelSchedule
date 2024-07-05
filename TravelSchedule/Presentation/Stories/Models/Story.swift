//
//  Model.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.06.2024.
//

import Foundation

struct Story: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subTitle: String
}
