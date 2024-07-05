//
//  DestinationFlowPage.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 15.04.2024.
//

import Foundation

enum DestinationFlowPage: Hashable, Identifiable {
    static func == (lhs: DestinationFlowPage, rhs: DestinationFlowPage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    case tabBar
    case selectingCityFrom
    case selectingStationFrom
    case selectingCityTo
    case selectingStationTo
    case listOfCarriers
    case filters
    case carrierDetail
    case stories
    
    var id: String {
        String(describing: self)
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .tabBar:
            hasher.combine("tabBar")
        case .selectingCityFrom:
            hasher.combine("selectingCityFrom")
        case .selectingStationFrom:
            hasher.combine("selectingStationFrom")
        case .selectingCityTo:
            hasher.combine("selectingCityTo")
        case .selectingStationTo:
            hasher.combine("selectingStationTo")
        case .listOfCarriers:
            hasher.combine("listOfCarriers")
        case .filters:
            hasher.combine("filters")
        case .carrierDetail:
            hasher.combine("carrierDetail")
        case .stories:
            hasher.combine("stories")
        }
    }
}
