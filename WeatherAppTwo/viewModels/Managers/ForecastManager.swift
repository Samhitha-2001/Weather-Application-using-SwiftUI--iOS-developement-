//
//  ForecastManager.swift
//  WeatherAppTwo
//
//  Created by Bhat, Samhitha on 29/01/24.
//

import Foundation
import CoreLocation

class ForecastManager: ObservableObject {
   
    func getForecast(location: CLLocation) async throws -> ForecastResponseBody {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else {
            throw URLError(.badURL)
        }
     
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
     
        let delegate = SessionDelegate()
        let session = URLSession(configuration: .default, delegate: delegate, delegateQueue: nil)
     
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedData = try JSONDecoder().decode(ForecastResponseBody.self, from: data)
            return decodedData
        } catch {
            // Log any errors that occur during the URLSession task
            print("Error getting forecast:", error)
            throw error
        }
    }
    
    func getForecastByCity(city: String) async throws -> ForecastResponseBody {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=da92ae08f9411eea2df794bff5b413e3") else {
            throw URLError(.badURL)
        }
     
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
     
        let delegate = SessionDelegate()
        let session = URLSession(configuration: .default, delegate: delegate, delegateQueue: nil)
     
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedData = try JSONDecoder().decode(ForecastResponseBody.self, from: data)
            return decodedData
        } catch {
            // Log any errors that occur during the URLSession task
            print("Error getting forecast:", error)
            throw error
        }
    }
}
//
//    //    func getForecast(location: CLLocation) async throws -> ForecastResponseBody {
//    //        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else {
//    //            fatalError("Missing URL")
//    //        }
//    //
//    //        var urlRequest = URLRequest(url: url)
//    //        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    //
//    //        let configuration = URLSessionConfiguration.default
//    //        configuration.waitsForConnectivity = true
//    //        configuration.connectionProxyDictionary = [:]
//    //
//    //        let delegate = SessionDelegate()
//    //        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
//    //
//    //        do {
//    //            let (data, response) = try await session.data(for: urlRequest)
//    //            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//    //                throw URLError(.badServerResponse)
//    //            }
//    //
//    //            let decodedData = try JSONDecoder().decode(ForecastResponseBody.self, from: data)
//    //            return decodedData
//    //        } catch {
//    //            throw error
//    //        }
//    //    }
// 
 
//class ForecastManager: ObservableObject {
//    static let shared = ForecastManager()
//    private let session: URLSession
//    
//    private init() {
//        let configuration = URLSessionConfiguration.default
//        configuration.waitsForConnectivity = true
//        configuration.connectionProxyDictionary = [:]
//        self.session = URLSession(configuration: configuration)
//    }
//    
//    func getForecast(location: CLLocation) async throws -> ForecastResponseBody {
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else {
//            throw URLError(.badURL)
//        }
//        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        do {
//            let (data, response) = try await session.data(for: urlRequest)
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                throw URLError(.badServerResponse)
//            }
//            
//            let decodedData = try JSONDecoder().decode(ForecastResponseBody.self, from: data)
//            return decodedData
//        } catch {
//            // Log any errors that occur during the URLSession task
//            print("Error getting forecast:", error)
//            throw error
//        }
//    }
//}
 


