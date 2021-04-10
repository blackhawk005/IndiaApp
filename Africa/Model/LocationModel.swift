//
//  LocationModel.swift
//  Africa
//
//  Created by Shinit Shetty on 09/04/21.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable{
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // Computed Property
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
