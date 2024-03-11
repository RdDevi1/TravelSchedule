//
//  SearchRouteService.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 11.03.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Routes = Components.Schemas.Routes

protocol SearchRouteServiceProtocol {
    func getRoutes(from: String, to: String, limit: Int?) async throws -> Routes
}

final class SearchRouteService: SearchRouteServiceProtocol {
    private let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    
    func getRoutes(from: String, to: String, limit: Int?) async throws -> Routes {
        let response = try await client .getRoutes(query: .init(from: from, to: to, limit: limit, transfers: false))
        return try response.ok.body.json
    }
}
