//
//  ViewFactory.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

class ViewFactory: ObservableObject {
   
    @ViewBuilder static func viewForDestination(_ destination: DestinationFlowPage) -> some View {
        switch destination {
        case .tabBar:
            self.getTabBar()
        case .selectingCityFrom:
            self.selectingCityFrom()
        case .selectingStationFrom:
            self.selectingStationFrom()
        case .selectingCityTo:
            self.selectingCityTo()
        case .selectingStationTo:
            self.selectingStationTo()
        case .listOfCarriers:
            self.listOfCarriers()
        case .filters:
            self.filters()
        case .carrierDetail:
            self.carrierDetail()
        }
    }
    
    static func getTabBar() -> some View {
        TabBarView(viewModel: TabBarViewModel())
    }
   
    static func selectingCityFrom() -> some View {
        SelectionCityView(typeOfFromTo: .from)
    }
    
    static func selectingStationFrom() -> some View {
        SelectionStationView(typeOfFromTo: .from)
    }
    static func selectingCityTo() -> some View {
        SelectionCityView(typeOfFromTo: .to)
    }
    
    static func selectingStationTo() -> some View {
        SelectionStationView(typeOfFromTo: .to)
    }
    
    static func listOfCarriers() -> some View {
        ListOfCarriersView()
    }
    
    static func filters() -> some View {
        FiltersView()
    }
    static func carrierDetail() -> some View {
        CarrierDetailView()
    }
}

