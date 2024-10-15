//
//  06-AddUserLocations.swift
//  SwiftUI-13-BucketList
//
//  Created by Esteban Cruz on 15/10/24.
//

import SwiftUI
import MapKit

struct _6_AddUserLocations: View {
    @State private var mapRegion = MKCoordinateRegion(center:                   CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var locations = [Location]()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations){
                location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }
                .ignoresSafeArea()
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        // Create a new location
                        let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        locations.append(newLocation)
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
    }
}

#Preview {
    _6_AddUserLocations()
}
