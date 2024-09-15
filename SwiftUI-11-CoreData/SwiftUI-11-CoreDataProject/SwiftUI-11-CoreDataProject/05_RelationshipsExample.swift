//
//  05_RelationshipsExample.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 23/8/24.
//

import SwiftUI

struct _5_RelationshipsExample: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArry, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add Examples") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Toblerone"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "CH"
                candy3.origin?.fullName = "Switzerland"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Tapita Gallito"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CRC"
                candy4.origin?.fullName = "Costa Rica"
                
                try? moc.save()
                
                
            }
        }
    }
}

#Preview {
    _5_RelationshipsExample()
}
