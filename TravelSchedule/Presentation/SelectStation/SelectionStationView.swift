//
//  SelectionStationView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

struct SelectionStationView: View {
    
    // MARK: - Properties
    
    var typeOfFromTo: TypeOfFromTo
    
    @State private var searchString = ""
   
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.dismiss) private var dismiss
    
    var searchResultStation: [Station] {
        switch typeOfFromTo {
        case .from:
            if searchString.isEmpty {
                return viewModel.selectedCityFrom?.stations ?? []
            } else {
                return viewModel.selectedCityFrom?.stations.filter {
                    $0.name.lowercased().contains(searchString.lowercased())
                } ?? []
            }
        case .to:
            if searchString.isEmpty {
                return viewModel.selectedCityTo?.stations ?? []
            } else {
                return viewModel.selectedCityTo?.stations.filter {
                    $0.name.lowercased().contains(searchString.lowercased())
                } ?? []
            }
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            if searchResultStation == [] {
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.YP.black)
            }
            
            VStack {
                CustomNavBar(
                    actionForLeftButton: {
                        dismiss()
                    },
                    title: "Выбор станции"
                )
                .padding(.top, 11)
                
                SearchBar(searchText: $searchString)
                
                LazyVStack {
                    
                    switch typeOfFromTo {
                    case .from:
                        ForEach(searchResultStation) { station in
                            SelectionCell(
                                action: {
                                    viewModel.selectedStationFrom = station
                                    viewModel.getTitleForListOfCarriers()
                                    dismiss()
                                    },
                                title: station.name
                            )
                            
                        }
                    case .to:
                        ForEach(searchResultStation) { station in
                            SelectionCell(
                                action: {
                                    viewModel.selectedStationTo = station
                                    viewModel.getTitleForListOfCarriers()
                                    dismiss()
                                },
                                title: station.name
                            )
                        }
                    }
                }
                Spacer()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
