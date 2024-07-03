//
//  MockModels.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import Foundation

struct City: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let stations: [Station]
}

struct Station: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

enum MockData {
    
    
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
