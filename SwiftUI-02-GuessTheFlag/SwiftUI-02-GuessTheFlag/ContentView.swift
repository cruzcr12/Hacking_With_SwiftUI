//
//  ContentView.swift
//  SwiftUI-02-GuessTheFlag
//
//  Created by Esteban Alonso Cruz Hidalgo on 10/9/23.
//

import SwiftUI

/* Custom view to display an Image view for a specific flag */
struct FlagImage: View {
    var country: String
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

// Custom modifier to apply the stile of title to a text
struct MainTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.blue)
    }
}

struct SubTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .font(.subheadline.weight(.heavy))
    }
}

// View extension to easily apply the Title modifier to any other view
extension View {
    func mainTitleStyle() -> some View {
        modifier(MainTitle())
    }
    
    func subTitleStyle() -> some View {
        modifier(SubTitle())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var questionsCount = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria",
                     "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var showingAlert = false
    @State private var showingResultAlert = false
    
    @State private var animationAmount = 0.0
    @State private var flagTappedIndex = 0
    @State private var flagOpacity = 1.0
    @State private var flagScaleAmount = 1.0
    
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                Text("Guess the Flag")
                    .mainTitleStyle()
                
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .subTitleStyle()
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){number in
                        Button {
                            flagTapped(number)
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 2)) {
                                animationAmount += 360
                                flagOpacity = 0.25
                                flagScaleAmount = 0.5
                            }
                            
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        
                        .rotation3DEffect(.degrees(flagTappedIndex == number ? animationAmount : 0),
                                          axis: (x: 0, y: 1, z: 0))
                        .opacity(flagTappedIndex != number ? flagOpacity : 1 )
                        .scaleEffect(flagTappedIndex != number ? flagScaleAmount : 1)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert("Results", isPresented: $showingResultAlert){
            Button("Restart the Game", action: resetGame)
        } message: {
            Text("Your final score is \(userScore)")
        }
    }
    
    func flagTapped(_ number: Int){
        flagTappedIndex = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        showingScore = true
        questionsCount += 1
        if questionsCount == 9 {
            showingResultAlert = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flagOpacity = 1
        flagScaleAmount = 1
    }
    
    func resetGame(){
        userScore = 0
        questionsCount = 1
        showingScore = false
        askQuestion()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
