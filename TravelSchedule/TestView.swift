//
//  TestView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import SwiftUI
import OpenAPIURLSession
import OpenAPIRuntime

struct TestView: View {
    var body: some View {
        VStack {
            Button("Показать ближайшие станции") {
                stations()
            }
            .padding()
            Button("Показать копирайт") {
                copyright()
            }
            .padding()
            Button("Показать ближайший город") {
                getNearestCity()
            }
            .padding()
            Button("Показать все станции") {
                getAllStations()
            }
            .padding()
            Button("Показать маршрут Москва - Тюмень") {
                getRoutes()
            }
            .padding()
            Button("Показать расписание аэропорта Шереметьево") {
                getScheduleFor()
            }
            .padding()
            Button("Показать нитку Москва - Тюмень") {
                getThread()
            }
            .padding()
            Button("Показать информацию о перевозчике") {
                getCarrierInfo()
            }
           
        }
        .padding()
    }
}

#Preview {
    TestView()
}


func stations() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    
    let service = NearestStationsService(client: client)
    
    Task {
        do {
            let stations = try await service.getNearestStations(lat: 55.779352, lng: 38.665602, distance: 5)
            print(stations)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

func copyright() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    let service = CopyrightService(client: client)
    
    Task {
        do {
            let copyright = try await service.getCopyright()
            print(copyright)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

func getRoutes() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    let service = SearchRouteService(client: client)
    
    Task {
        do {
            let routes = try await service.getRoutes(from: Cities.moscow, to: Cities.tumen, limit: 1)
            print(routes)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

func getScheduleFor() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    let service = StationScheduleService(client: client)
    
    Task {
        do {
            let schedule = try await service.getScheduleFor(station: cityStations.svo, limit: 5, date: "2024-03-12")
            print(schedule)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

func getThread() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    let service = ThreadService(client: client)
    
    Task {
        do {
            let thread = try await service.getThread(threadUID: ThreadUID.thread)
            print(thread)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

func getNearestCity() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    let service = NearestCityService(client: client)
    
    Task {
        do {
            let city = try await service.getNearestCity(lat: 55.779352, lng: 38.665602, distance: 50)
            print(city)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

func getCarrierInfo() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    let service = CarrierInfoService(client: client)
    
    Task {
        do {
            let carrier = try await service.getCarrier(code: "123")
            print(carrier)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

func getAllStations() {
    let client = Client (
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport(),
        middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Constants.apiKey)]
    )
    let service = AllStationsService(client: client)
    
    Task {
        do {
            let dataRaw = try await service.getAllStations()
            let data = try await Data(collecting: dataRaw, upTo: 50*1024*1024)
            let stations = try JSONDecoder().decode(Components.Schemas.AllStations.self, from: data)
            print(stations.countries?.count as Any)
            // warning: very heavy answer
            //print(stations)
        } catch {
            print("Ошибка  \(error)")
        }
    }
}

