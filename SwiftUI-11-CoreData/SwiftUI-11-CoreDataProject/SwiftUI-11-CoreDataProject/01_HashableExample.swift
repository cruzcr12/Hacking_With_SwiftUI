//
//  01_HashableExample.swift
//  SwiftUI-11-CoreDataProject
//
//  Created by Esteban Cruz on 21/8/24.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct _1_HashableExample: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Louse Lane")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

#Preview {
    _1_HashableExample()
}
