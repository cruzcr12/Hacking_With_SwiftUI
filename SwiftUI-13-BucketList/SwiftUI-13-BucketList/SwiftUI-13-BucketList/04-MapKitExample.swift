//
//  04-MapKitExample.swift
//  SwiftUI-13-BucketList
//
//  Created by Esteban Cruz on 11/10/24.
//
import MapKit
import SwiftUI

// 1. Define a new type for the location
struct LocationType: Identifiable {
  let id = UUID()
  let name: String
  let coordinate: CLLocationCoordinate2D
}

struct _4_MapKitExample: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    // 2. Create an array containing the locations
    let locations = [
        LocationType(name: "Buckingham Palace", coordinate:
                    CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        LocationType(name: "Tower of London", coordinate:
                    CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
    ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: locations){ location in
                // 3. Adding annotations
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                            .onTapGesture {
                                print("Tapped on \(location.name)")
                            }
                    }
                }
            }
        }
        .navigationTitle("London Explorer")
        
    }
}

#Preview {
    _4_MapKitExample()
}
