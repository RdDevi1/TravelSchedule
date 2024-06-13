//
//  AppCommunicator.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

protocol SchedulesNavigator {
    func selectingCityFrom()
    func selectingStationFrom()
    func selectingCityTo()
    func selectingStationTo()
    func listOfCarriers()
    func filters()
    func carrierDetail()
}

final class BaseCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentSheetItem: DestinationFlowPage?
    @Published var fullCoverItem: DestinationFlowPage?
    
    func goToRoot() {
        path.removeLast(path.count)
    }
    
    func removeLast() {
        path.removeLast()
    }
}

extension BaseCoordinator: SchedulesNavigator {
    
    func selectingCityFrom() {
        fullCoverItem = .selectingCityFrom
    }
    
    func selectingStationFrom() {
        fullCoverItem = .selectingStationFrom
    }
    
    func selectingCityTo() {
        fullCoverItem = .selectingCityTo
    }
    
    func selectingStationTo() {
        fullCoverItem = .selectingStationTo
    }
    
    func listOfCarriers() {
        path.append(DestinationFlowPage.listOfCarriers)
    }
    
    func filters() {
        path.append(DestinationFlowPage.filters)
    }
    
    func carrierDetail() {
        path.append(DestinationFlowPage.carrierDetail)
    }
}

protocol AnyDataModel {
    var data: Any? { get set }
    var index: Int? { get set }
    var id: String? { get set }
}

