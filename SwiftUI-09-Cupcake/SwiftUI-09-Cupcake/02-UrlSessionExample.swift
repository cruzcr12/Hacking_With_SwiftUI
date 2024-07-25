//
//  02-UrlSessionExample.swift
//  SwiftUI-09-Cupcake
//
//  Created by cradmin on 23/2/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct _2_UrlSessionExample: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        // 1. Define the url
        guard let url = URL(string: "https://itunes.app.com/search=mudvayne&entity=song")
        else {
            // If it fails to get the information, print message and exit. It should not fail
            print("Invalid URL")
            return
        }
        // 2. Fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
    
}

#Preview {
    _2_UrlSessionExample()
}
