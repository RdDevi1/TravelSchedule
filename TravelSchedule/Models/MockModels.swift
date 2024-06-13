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

enum MockData {
    
    static let stories: [Story] = [
        Story(
            images: ["1"],
            title: "Test Test",
            subTitle: "Test Test Test Test Test Test Test Test"
        ),
        Story(
            images: ["2", "21", "22"],
            title: "Test Test Test Test",
            subTitle: "Test Test Test Test Test Test Test Test"
        ),
        Story(
            images: ["3"],
            title: "Test Test Test Test Test Test",
            subTitle: "Test Test Test Test Test Test Test Test"
        ),
        Story(
            images: ["4"],
            title: "Test Test Test Test Test Test Test Test",
            subTitle: "Test Test Test Test Test Test Test Test")
    ]
    
    
    static let cities: [City] = [
        City(
            name: "City1",
            stations: [
                Station(name: "Station1"),
                Station(name: "Station2"),
                Station(name: "Station3"),
            ]
        ),
        City(
            name: "City2",
            stations: [
                Station(name: "Station1"),
                Station(name: "Station2"),
                Station(name: "Station3"),
                Station(name: "Station4"),
                Station(name: "Station5"),
            ]
        ),
        City(
            name: "City3",
            stations: [
                Station(name: "Station1"),
                Station(name: "Station2"),
                Station(name: "Station3"),
                Station(name: "Station4"),
                Station(name: "Station5"),
            ]
        ),
        City(
            name: "City4",
            stations: [
                Station(name: "Station1"),
                Station(name: "Station2")
            ]
        )
    ]
    
}
