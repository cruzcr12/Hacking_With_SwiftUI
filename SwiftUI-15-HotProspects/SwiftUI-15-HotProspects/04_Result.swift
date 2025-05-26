//
//  04_Result.swift
//  SwiftUI-15-HotProspects
//
//  Created by Esteban Cruz on 29/11/24.
//

import SwiftUI

struct _4_Result: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        let result = await fetchTask.result
    }
}

#Preview {
    _4_Result()
}
