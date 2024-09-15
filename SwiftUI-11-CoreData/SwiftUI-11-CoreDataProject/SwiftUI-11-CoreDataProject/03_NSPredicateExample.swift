//
//  03_NSPredicateExample.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 22/8/24.
//

import SwiftUI

struct _3_NSPredicateExample: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate:
                    NSPredicate(format: "universe == %@", "Star Wars")
    ) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
        }
        
        Button("Add Examples"){
            let ship1 = Ship(context: moc)
            ship1.name = "Enterprise"
            ship1.universe = "Star Trek"
            
            let ship2 = Ship(context: moc)
            ship2.name = "Defiant"
            ship2.universe = "Star Trek"
            
            let ship3 = Ship(context: moc)
            ship3.name = "Millennium Falcon"
            ship3.universe = "Star Wars"
            
            let ship4 = Ship(context: moc)
            ship4.name = "Executor"
            ship4.universe = "Star Wars"
            
            try? moc.save()
        }
    }
}

#Preview {
    _3_NSPredicateExample()
}
