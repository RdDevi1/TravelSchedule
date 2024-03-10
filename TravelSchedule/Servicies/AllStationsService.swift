//
//  AllStationsService.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 10.03.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Stations = Components.Schemas.AllStations

protocol AllStationsServiceProtocol {
    func getAllStations() async throws -> Stations
}

final class AllStationsService: AllStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getAllStations() async throws -> Stations {
        let response = try await client.getAllStations(query: .init(apikey: apikey))
        
        return try response.ok.body.json
    }
}
