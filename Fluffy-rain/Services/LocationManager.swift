//
//  LocationLayer.swift
//  Fluffy-rain
//
//  Created by Артур Цыганов on 22.08.2022.
//

import Foundation
import CoreLocation

class LocationManager:NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    let locationManager = CLLocationManager()
    var city = ""
    var completion: (() -> Void)?
    
    override init() {}

    func getCurrentLocation() {
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
       
        
    }
    
    func getCityFromLocation(with currentLocation: CLLocation) {
        let geodecoder = CLGeocoder()
       
        
        geodecoder.reverseGeocodeLocation(currentLocation, preferredLocale: .current) { placeMark, error in
            guard let place = placeMark?.first, error == nil else {
                print("ERROR GEOCODER")
                return
            }
            
            if let locality = place.locality{
                self.city = locality
            }
            
            self.completion!()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        locationManager.stopUpdatingLocation()
        getCityFromLocation(with: location)
        
        
        
    }
    
}
