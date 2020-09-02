//
//  SavedImage.swift
//  Challenge 13
//
//  Created by Nikhi on 01/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

class ImageModel: Codable, Comparable {
    
    var id: String
    var name: String
    var imageName: String
    var imagePath = ""
    
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
    
    init(name: String, coordinate: CLLocationCoordinate2D?) {
        self.id = UUID().uuidString
        self.imageName = self.id + ".jpeg"
        self.name = name
        self.latitude = coordinate!.latitude
        self.longitude = coordinate!.longitude
    }
    
    static func < (lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.name == rhs.name
    }
}
