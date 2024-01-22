//
//  HierarchicalCodableData.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 15/1/24.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct HierarchicalCodableData: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "John Smith",
                "address": {
                    "street": "555, Ever Green Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data){
                print(user.address.street)
            }
        }
    }
}

#Preview {
    HierarchicalCodableData()
}
