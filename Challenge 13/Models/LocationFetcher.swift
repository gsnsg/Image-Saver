//
//  LocationFetcher.swift
//  Challenge 13
//
//  Created by Nikhi on 02/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation
import CoreLocation


class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    
    
    override init() {
        super.init()
        manager.delegate = self
        start()
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
