//
//  InsertMapView.swift
//  Africa
//
//  Created by Shinit Shetty on 09/04/21.
//

import SwiftUI
import MapKit

struct InsertMapView: View {
    // MARK: - PROPERTIES
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629), span: MKCoordinateSpan(latitudeDelta: 35.0, longitudeDelta: 35.0))
    
    
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        })
            .overlay(
                NavigationLink(destination: MapView()){
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                }//: NAVIGATION
                .padding(12)
                , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}


// MARK: - PREVIEW
struct InsertMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsertMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
