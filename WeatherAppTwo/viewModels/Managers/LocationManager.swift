//
//  LocationManager.swift
//  WeatherAppTwo
//
//  Created by Bhat, Samhitha on 24/01/24.
//

import Foundation
import CoreLocation

class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    @Published var location : CLLocation?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        isLoading = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
        manager.stopUpdatingLocation()
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error : \(error.localizedDescription)")
        isLoading = false
    }
}
//import Foundation
//import CoreLocation
//import Combine
// 
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    private let manager = CLLocationManager()
//    @Published var location: CLLocation?
//    @Published var isLoading = false
// 
//    private var cancellables: Set<AnyCancellable> = []
// 
//    override init() {
//        super.init()
//        manager.delegate = self
//    }
// 
//    func requestLocation() {
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//        isLoading = true
//    }
// 
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        self.location = location
//        manager.stopUpdatingLocation()
//        isLoading = false
//    }
// 
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error.localizedDescription)
//        isLoading = false
//    }
//}
