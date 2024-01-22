//
//  MissionView.swift
//  SwiftUI-07-Moonshot
//
//  Created by cradmin on 18/1/24.
//

import SwiftUI

struct MissionView: View {
        
    let mission: Mission
    let astronauts: [String: Astronaut]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        //Use only 60% of available width
                        .frame(maxWidth: geometry.size.width * 0.60)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDateLong)
                        .font(.title2)
                        .italic()
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        CustomDivider()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        CustomDivider()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    CrewMembersView(mission: mission, astronauts: astronauts)
                    
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    // Initialize the mission and crew structures
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.astronauts = astronauts
    }
}


struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
    
    
}
