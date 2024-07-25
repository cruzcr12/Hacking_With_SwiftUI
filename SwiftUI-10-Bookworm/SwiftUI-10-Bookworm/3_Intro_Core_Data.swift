//
//  3_Intro_Core_Data.swift
//  SwiftUI-10-Bookworm
//
//  Created by Esteban Cruz on 20/5/24.
//

import SwiftUI

struct __Intro_Core_Data: View {
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna",
                                  "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
        .padding()
    }
}

#Preview {
    __Intro_Core_Data()
}
