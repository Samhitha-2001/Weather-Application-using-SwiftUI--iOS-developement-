//
//  ContentView.swift
//  WeatherAppTwo
//
//  Created by Bhat, Samhitha on 24/01/24.
//

//#1F1B48

import SwiftUI
import CoreLocation


struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    var forecastManager = ForecastManager()
    @State var weather: WeatherResponseBody?
    @State var forecast: ForecastResponseBody?
    @StateObject var mainViewModel = MainViewModel()
    
    
    
    var body: some View {
        VStack {
            if locationManager.location != nil {
                if weather != nil {
                    MainScreenView(
                        weather: self.$weather,
                        forecast: self.$forecast,
                        mainViewModel: mainViewModel
                    )
                    .onReceive(mainViewModel.$city){ newCity in
                        fetchWeather()
                        fetchForecast()
                        
                    }
                }
                else {
                    Text("Loading...")
                        .onAppear {
                            print("Location is available. Fetching weather...")
                            fetchWeather()
                            fetchForecast()
                        }
                }
            }
            else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    Text("Location is nil or not available.")
                }
            }
        }
        .onAppear {
            print("Requesting location...")
            locationManager.requestLocation()
        }
    }
    
     func fetchWeather() {
        guard let location = locationManager.location else {
            print("Location is nil. Cannot fetch weather.")
            return
        }
        
            DispatchQueue.global().async {
                Task{
                    do {
                        let currentWeather = try await mainViewModel.city == "" ? weatherManager.getCurrentWeather(location: location) : weatherManager.getCurrentWeatherByCityName(city: mainViewModel.city)
                        DispatchQueue.main.async {
                            self.weather = currentWeather
                        }
                    } catch {
                        print("Error fetching weather:", error)
                    }

                }       
            }
    }
     func fetchForecast() {
        guard let location = locationManager.location else {
            print("Location is nil. Cannot fetch forecast.")
            return
        }
        
            DispatchQueue.global().async {
                Task{
                    do {
                        let currentForecast = try await mainViewModel.city == "" ? forecastManager.getForecast(location: location) : forecastManager.getForecastByCity(city: mainViewModel.city)
                        DispatchQueue.main.async {
                            self.forecast = currentForecast
                        }
                    } catch {
                        print("Error fetching forecast:", error)
                    }

                }
            }
    }
}

//struct ContentView: View {
//    
//    @StateObject var locationManager = LocationManager()
//    var weatherManager = WeatherManager.shared
//    var forecastManager = ForecastManager.shared
//    @State var weather: WeatherResponseBody?
//    @State var forecast: ForecastResponseBody?
//    @StateObject var mainViewModel = MainViewModel()
//    
//    var body: some View {
//        VStack {
//            if let location = locationManager.location {
//                if weather != nil {
//                    MainScreenView(
//                        weather: self.$weather,
//                        forecast: self.$forecast,
//                        mainViewModel: mainViewModel
//                    )
//                }
//                else {
//                    LoadingView()
//                        .task {
//                            do {
//                                weather = try await weatherManager.getCurrentWeather(location: location)
//                                forecast = try await forecastManager.getForecast(location: location)
//                            } catch {
//                                print("Error getting weather or forecast: \(error)")
//                            }
//                        }
//                }
//            }
//            else {
//                if locationManager.isLoading {
//                    LoadingView()
//                }
//            }
//        }
//        .onAppear{
//            locationManager.requestLocation()
//        }
//    }
//}

//struct ContentView: View {
//    
//    @StateObject var locationManager = LocationManager()
//    var weatherManager = WeatherManager.shared
//    var forecastManager = ForecastManager.shared
//    @State var weather: WeatherResponseBody?
//    @State var forecast: ForecastResponseBody?
//    @StateObject var mainViewModel = MainViewModel()
//    
//    var body: some View {
//        VStack {
//            if let location = locationManager.location {
//                if weather != nil {
//                    MainScreenView(
//                        weather: self.$weather,
//                        forecast: self.$forecast, 
//                        mainViewModel: mainViewModel
//                    )
//                }
//                else {
////                    LoadingView()
////                        .task {
////                            do {
////                                weather = try await weatherManager.getCurrentWeather(location: location)
////                                forecast = try await forecastManager.getForecast(location: location)
////                            } catch {
////                                print("Error getting weather: \(error)")
////                            }
////                        }
//                    LoadingView()
//                        .task {
//                            do {
//                                weather = try await WeatherManager.shared.getCurrentWeather(location: location)
//                                forecast = try await ForecastManager.shared.getForecast(location: location)
//                            } catch {
//                                print("Error getting weather or forecast: \(error)")
//                                // Handle the error gracefully, e.g., show an alert to the user
//                            }
//                        }
//                }
//            }
//            else {
//                if locationManager.isLoading {
//                    LoadingView()
//                }
//                
//            }
//            
//            
//            
//        }
//        .onAppear{
//            locationManager.requestLocation()
//        }
//    }
//}

//struct ContentView: View {
//    @StateObject var locationManager = LocationManager()
//    @StateObject var weatherManager = WeatherManager()
//    @State var weather: WeatherResponseBody?
//    
//    var body: some View {
//        VStack {
//            if let location = locationManager.location {
//                if let weather = weather {
//                    WeatherView(weather: weather)
//                        .onAppear {
//                            // Refresh weather data when WeatherView appears
//                            refreshWeather(location: location)
//                        }
//                } else {
//                    LoadingView()
//                }
//            } else {
//                if locationManager.isLoading {
//                    LoadingView()
//                }
//            }
//        }
//        .padding()
//        .onAppear {
//            locationManager.requestLocation()
//        }
//    }
// 
//    private func refreshWeather(location: CLLocation) {
//        Task {
//            do {
//                let refreshedWeather = try await weatherManager.getCurrentWeather(location: location)
//                // Update weather property on the main thread
//                DispatchQueue.main.async {
//                    weather = refreshedWeather
//                }
//            } catch {
//                print("Error refreshing weather: \(error)")
//            }
//        }
//    }
//}

#Preview {
    ContentView()
}
