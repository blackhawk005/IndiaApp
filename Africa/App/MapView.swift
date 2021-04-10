//
//  Mapview.swift
//  Africa
//
//  Created by Shinit Shetty on 08/04/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var mainLatitude: CLLocationDegrees = 20.5937
    @State private var mainLongitude: CLLocationDegrees = 82.9629
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 20.5937, longitude: 82.9629)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 35.00, longitudeDelta: 35.00)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    @State private var locationName: String = ""
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - No 1 BASIC MAP
        // Map(coordinateRegion: $region)
        
        // MARK: - No 2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            // (A) PIN: OLD STYLE (ALWAYS STATIC)
            // MapPin(coordinate: item.location, tint: .accentColor)
            // (B) MARKER: NEW STYLE (ALWAYS STATIC)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            // MapAnnotation(coordinate: item.location){
            //     Image("logo")
            //        .resizable()
            //        .scaledToFit()
            //        .frame(width: 32, height: 32, alignment: .center)
            // }//: Annotation
            
            // (D) CUSTOM ADVANCED NOTATION (COULD BE INTERACTIVE)
            MapAnnotation(coordinate: item.location){
                Button(action: {
                    locationName = item.name
                    region.center.latitude = item.latitude
                    region.center.longitude = item.longitude
                    region.span.latitudeDelta = 10.00
                    region.span.longitudeDelta = 10.00
                    hapticImpact.impactOccurred()
                }){
                    MapAnnotationView(location: item)
                }
                
            }
        })//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Place name:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(locationName)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }//: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
            
        )
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
