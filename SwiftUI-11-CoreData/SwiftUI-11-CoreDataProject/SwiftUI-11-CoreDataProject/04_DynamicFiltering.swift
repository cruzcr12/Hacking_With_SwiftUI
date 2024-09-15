//
//  04_DynamicFiltering.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 22/8/24.
//

import SwiftUI

struct _4_DynamicFiltering: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var lastNameFilter = "T"
    
    var body: some View {
        VStack {
            // list of matching singers
            _4_FilteredList(filterKey: "lastName", filterValue: lastNameFilter){ (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples"){
                let bjorn = Singer(context: moc)
                bjorn.firstName = "Bjorn"
                bjorn.lastName = "Speed"
                
                let wayne = Singer(context: moc)
                wayne.firstName = "Wayne"
                wayne.lastName = "Static"
                
                let corey = Singer(context: moc)
                corey.firstName = "Corey"
                corey.lastName = "Taylor"
                
                try? moc.save()
            }
            
            Button("Show T" ){
                lastNameFilter = "T"
            }
            
            Button("Show S" ){
                lastNameFilter = "S"
            }
        }
    }
}

#Preview {
    _4_DynamicFiltering()
}
