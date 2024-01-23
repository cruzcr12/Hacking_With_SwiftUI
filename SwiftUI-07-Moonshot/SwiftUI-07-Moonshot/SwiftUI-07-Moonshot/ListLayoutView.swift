//
//  ListLayoutView.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 23/1/24.
//

import SwiftUI

struct ListLayoutView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
            List(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack() {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(10)
                    //.padding(.horizontal, 10)
                }
                .listRowBackground(Color.darkBackground)
                .listRowSeparator(.hidden)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                )
            }
            .listStyle(.plain)
    }
        
}

struct ListLayoutView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayoutView(astronauts: astronauts, missions: missions)
        
    }
}
