//
//  MainViewModel.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.04.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var stories: [Story]
    @Published var cities: [City]
    
    @Published var selectedStory: Story?
    
    @Published var selectedCityFrom: City?
    @Published var selectedCityTo: City?
    @Published var selectedStationFrom: Station?
    @Published var selectedStationTo: Station?
    
    @Published var titleForListOfCarriers: String = ""
    
    @Published var selectedTimeFilter: [String] = []
    @Published var selectedTransferFilter: [String] = []
    @Published var isApplyFilters: Bool = false
    
    // MARK: - Init
    
    init(
        stories: [Story],
        cities: [City]
    ) {
        self.stories = stories
        self.cities = cities
        getStories()
        getCities()
    }
    
    // MARK: - Methods
    
    func getTitleForListOfCarriers() {
        if let cityFrom = selectedCityFrom,
           let cityTo = selectedCityTo,
           let stationFrom = selectedStationFrom,
           let stationTo = selectedStationTo {
            self.titleForListOfCarriers =  cityFrom.name
            + "("
            + stationFrom.name
            + ") -> "
            + cityTo.name
                 + "("
                 + stationTo.name
                 + ")"
        }
    }
    
    func switchStations() {
        if selectedStationTo?.name != nil && selectedStationFrom?.name != nil {
            let newStationTo = selectedStationFrom
            selectedStationFrom = selectedStationTo
            selectedStationTo = newStationTo
        }
    }
    
    private func getStories() {
        stories = MockData.stories
    }
    
    private func getCities() {
        cities = MockData.cities
    }
    
    func updateSelectedTime(time: String) {
        if selectedTimeFilter.contains(time) {
            selectedTimeFilter = selectedTimeFilter.filter {$0 != time}
        } else {
            selectedTimeFilter.append(time)
        }
    }
    
    func updateSelectedTransfer(transfer: String) {
        if selectedTransferFilter.isEmpty {
            selectedTransferFilter.append(transfer)
        } else {
            if selectedTransferFilter.contains(transfer) {
                selectedTransferFilter = []
            } else {
                selectedTransferFilter = []
                selectedTransferFilter.append(transfer)
            }
        }
    }
}

