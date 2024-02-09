//
//  WeatherManager.swift
//  WeatherAppTwo
//
//  Created by Bhat, Samhitha on 24/01/24.
//

import Foundation
import CoreLocation

class WeatherManager: ObservableObject {
    // ...
 
    func getCurrentWeather(location: CLLocation) async throws -> WeatherResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else {
            fatalError("Missing URL")
        }
 
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
 
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.connectionProxyDictionary = [:]
 
        let delegate = SessionDelegate()
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
 
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
 
            let decodedData = try JSONDecoder().decode(WeatherResponseBody.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
    
    func getCurrentWeatherByCityName(city: String) async throws -> WeatherResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=da92ae08f9411eea2df794bff5b413e3") else {
            fatalError("Missing URL")
        }
 
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
 
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.connectionProxyDictionary = [:]
 
        let delegate = SessionDelegate()
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
 
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
 
            let decodedData = try JSONDecoder().decode(WeatherResponseBody.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
}
//class WeatherManager : NSObject, ObservableObject {
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
//    func getCurrentWeather(location : CLLocation) async throws -> WeatherResponseBody {
//
//        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else { fatalError("Missing URL") }
//
//        let configuration = URLSessionConfiguration.default
//        configuration.waitsForConnectivity = true
//        configuration.connectionProxyDictionary = [:]
//
//        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//        let urlRequest = URLRequest(url: url)
//        let (data, response) = try await session.data(for: urlRequest)
////        let urlRequest = URLRequest(url: url)
////
////        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
//
//        let decodedData = try JSONDecoder().decode(WeatherResponseBody.self, from: data)
//
//        return decodedData
//
//
//    }
//    func getCurrentWeather(location: CLLocation) async throws -> WeatherResponseBody {
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else {
//                    fatalError("Missing URL")
//                }
//
//                var urlRequest = URLRequest(url: url)
//                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//                let configuration = URLSessionConfiguration.default
//                configuration.waitsForConnectivity = true
//                configuration.connectionProxyDictionary = [:]
//
//                let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//
//                do {
//                    let (data, response) = try await session.data(for: urlRequest)
//                    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//                        throw URLError(.badServerResponse)
//                    }
//
//                    let decodedData = try JSONDecoder().decode(WeatherResponseBody.self, from: data)
//                    return decodedData
//                } catch {
//                    throw error
//                }
//
//        }
    
//    func getCurrentWeather(location: CLLocation) async throws -> WeatherResponseBody {
//    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else {
//                fatalError("Missing URL")
//            }
//
//            var urlRequest = URLRequest(url: url)
//            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//            let configuration = URLSessionConfiguration.default
//            configuration.waitsForConnectivity = true
//            configuration.connectionProxyDictionary = [:]
//
//            do {
//                let (data, response) = try await URLSession(configuration: configuration).data(for: urlRequest)
//                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//
//                let decodedData = try JSONDecoder().decode(WeatherResponseBody.self, from: data)
//                return decodedData
//            } catch {
//                throw error
//            }
//        }
    
    
    
//}

//extension WeatherManager: URLSessionDelegate {
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust else {
//            completionHandler(.performDefaultHandling, nil)
//            return
//        }
//
//        guard
//            let serverTrust = challenge.protectionSpace.serverTrust,
//            SecTrustEvaluateWithError(serverTrust, nil)
//        else {
//            completionHandler(.cancelAuthenticationChallenge, nil)
//            return
//        }
//
//        let credential = URLCredential(trust: serverTrust)
//        completionHandler(.useCredential, credential)
//    }
//}

//class WeatherManager: ObservableObject {
//    static let shared = WeatherManager()
//    private let session: URLSession
//    
//    private init() {
//        let configuration = URLSessionConfiguration.default
//        configuration.waitsForConnectivity = true
//        configuration.connectionProxyDictionary = [:]
//        self.session = URLSession(configuration: configuration)
//    }
//    
//    func getCurrentWeather(location: CLLocation) async throws -> WeatherResponseBody {
//            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=da92ae08f9411eea2df794bff5b413e3") else {
//            fatalError("Missing URL")
//        }
//        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        do {
//            let (data, response) = try await session.data(for: urlRequest)
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//                throw URLError(.badServerResponse)
//            }
//            
//            let decodedData = try JSONDecoder().decode(WeatherResponseBody.self, from: data)
//            return decodedData
//        } catch {
//            throw error
//        }
//    }
//}
 

