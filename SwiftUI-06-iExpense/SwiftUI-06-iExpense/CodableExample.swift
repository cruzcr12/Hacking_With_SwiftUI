//
//  CodableExample.swift
//  SwiftUI-06-iExpense
//
//  Created by cradmin on 8/1/24.
//

import SwiftUI

struct UserObj: Codable {
    let firstName: String
    let lastName: String
}

struct CodableExample: View {
    
    @State private var user = UserObj(firstName: "John", lastName: "Smith")
    
    var body: some View {
        Button("Save User"){
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user){
                UserDefaults.standard.setValue(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    CodableExample()
}
