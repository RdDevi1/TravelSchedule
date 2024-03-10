//
//  NearestStationsService.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 10.03.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}

final class NearestStationsService: NearestStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
}
//
//func stations() {
//    let client = Client(
//        serverURL: try Servers.server1(),
//        transport: URLSessionTransport()
//    )
//    
//    let service = NearestStationsService(
//        client: client,
//        apikey: "ВАШ КЛЮЧ"
//    )
//    
//    Task {
//        let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
//        print(stations)
//    }
//}
