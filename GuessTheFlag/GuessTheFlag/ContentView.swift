//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shawn on 9/21/23.
//

import SwiftUI

struct prominentTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold()) // a shortcut for ".largeTitle.weight(.bold)"
            .foregroundStyle(.white)
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(prominentTitleModifier())
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US", "China", "Taiwan", "Laos", "Philippines", "Japan", "Canada", "Malaysia", "Indonesia", "Vietnam", "Singapore", "USSR", "Korea", "North Korea", "Hong Kong"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var roundMax = 5
    let roundRange = 3...10
    
    // alert switch
    @State private var showingScore = false
    @State private var finalGame = false
    
    // round picker switch
    @State private var disablePicker = false
    
    // score alert
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var scoreMessage = ""
    // final result alert
    @State private var round = 0
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    
    struct FlagImageView: View {
        var countryName: String
        
        var body: some View {
            Image(countryName)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 8)
        }
        
        init(_ countryName: String) {
            self.countryName = countryName
        }
    }
        
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Text("Guess the Flag")
                    .prominentTitle()
                HStack{
                    Text(disablePicker ? "Total Rounds: " : "Select Total Rounds:")
                        .font(.title3.bold())
                        .foregroundStyle(disablePicker ? .gray : .white)
                    Picker("Pick Round", selection: $roundMax) {
                        ForEach(roundRange, id:\.self){
                            Text($0, format: .number)
                        }
                    }
                    .background(.thinMaterial)
                    .clipShape(Capsule())
                    .disabled(disablePicker)
                }
                
                Spacer()
                Text("Round: \(round)")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                Spacer()
                VStack (spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        } label: {
                            FlagImageView(countries[number])
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                
                Spacer()
//                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .padding(.vertical)
                Button("Start Over", role: .cancel, action: gameReset)
                    .buttonStyle(.borderedProminent)
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                if round == roundMax {
                    finalRound()
                } else {
                    askQuestion()
                }
            }
        } message: {
            Text(scoreMessage)
        }
        .alert(resultTitle, isPresented: $finalGame){
            Button("Start a new game", action: gameReset)
        } message: {
            Text(resultMessage)
        }
    }
    
    func flagTapped(_ number: Int) {
        disablePicker = true
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
            scoreMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong!"
            scoreMessage = "You clicked the flag of \(countries[number])"
        }
        showingScore = true
        round += 1
    }
    
    func finalRound() {
        let passRound = roundMax / 2 + 1
        if score >= passRound{
            resultTitle = "Congratulation! You win!"
            resultMessage = "You final score is \(score)"
        } else {
            resultTitle = "Game Over"
            resultMessage = "You final score is \(score)"
        }
        finalGame = true
    }
    
    func askQuestion() {
        let previousCountry = countries[correctAnswer]
        countries.shuffle()
        correctAnswer = nextCorrectAnswer(previousCountry: previousCountry, in: 0...2)
    }
    
    func gameReset() {
        askQuestion()
        round = 0
        score = 0
        disablePicker = false
    }
    
    func nextCorrectAnswer(previousCountry: String, in select_range: ClosedRange<Int>) -> Int {
        var random = Int.random(in: select_range)
        while countries[random] == previousCountry {
            random = Int.random(in: select_range)
        }
        return random
    }
}

#Preview {
    ContentView()
}
