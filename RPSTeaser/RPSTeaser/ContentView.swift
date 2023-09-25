//
//  ContentView.swift
//  RPSTeaser
//
//  Created by Shawn on 9/24/23.
//

import SwiftUI

struct buttonTextModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(30)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
    }
}

extension View {
    func buttonText() -> some View {
        modifier(buttonTextModifier())
    }
}

struct ContentView: View {
    let RPSs = ["👊", "🖐️", "✌️"]
    // round count and round setting
    @State private var roundMax = 5
    @State private var round = 0
    let roundRange = 3...10
    
    // cpu choice and game mode
    @State private var currentRPSIndex = Int.random(in: 0...2)
    @State private var currentGameMode = Bool.random()
    
    // score accounting
    @State private var score = 0
    @State private var rightTimes = 0
    @State private var wrongTimes = 0
    @State private var stars = ""
    
    // switchers
    @State private var scoreBoardShow = false
    @State private var randomMode = false
    var gameStarted: Bool {
        round > 0
    }
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 50/255, green: 119/255, blue: 134/255), location: 0.2),
                .init(color: Color(red: 255/255, green: 214/255, blue: 100/255), location: 0.2),
            ], center: .top, startRadius: 90, endRadius: 600)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                VStack{
                    Text("Rock-Paper-Scissors")
                        .font(.title).bold()
                        .foregroundStyle(.white)
                    Text("Teaser!")
                        .font(.largeTitle).bold()
                        .foregroundStyle(.white)
                }
                .padding()
                Spacer()
                Spacer()
                Spacer()
                HStack {
                    Text(gameStarted ? "Total Rounds: " : "Select Total Rounds: ")
                        .font(.title3)
                        .foregroundStyle(.black)
                    Picker("Round Picker", selection: $roundMax){
                        ForEach(roundRange, id: \.self) {
                            Text($0, format:.number)
                        }
                    }
                    .tint(.secondary)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
                    .disabled(gameStarted)
                }.padding(.top)
                Text("Round: \(round)")
                    .padding(.bottom)
                    .font(.title2.bold())
                    .foregroundStyle(.black)
                VStack {
                    Text("Try to ...")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(currentGameMode ? "Win!" : "Lose!")
                        .foregroundStyle(.primary)
                        .font(.largeTitle.bold())
                    Text(RPSs[currentRPSIndex])
                        .font(.system(size: 100))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                Spacer()
                Spacer()
                
                // selection area
                HStack{
                    ForEach(RPSs, id: \.self) {rps in
                        Button{
                            answerTapped(rps)
                        } label: {
                            Text(rps)
                                .buttonText()
                        }
                    }
                }
                .buttonStyle(.plain)
                .font(.largeTitle)
                .padding()
                // score area
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundStyle(.black)
//                    .padding()
                VStack{
                    Button{
                        resetGame()
                    } label: {
                        Text("Restart")
                    }
                    .buttonStyle(.borderedProminent)
                    HStack {
                        Text("Random Mode")
                            .font(.footnote)
                            .foregroundStyle(gameStarted ? .gray : .black)
                        Toggle("", isOn: $randomMode)
                            .labelsHidden()
                            .disabled(gameStarted)
                            .toggleStyle(.automatic)
                        .padding(.horizontal)
                    }
                    .padding(5)
                }.padding()
            }
            .padding()
            .alert("Game Ends", isPresented: $scoreBoardShow) {
                Button("Start a new game", action: resetGame)
            } message: {
                Text(
                    """
                    Final Score: \(score)
                    Right Answers: \(rightTimes)
                    Wrong Answers: \(wrongTimes)
                    Brain Rating: \(stars)
                    """)
            }
        }
    }
    
    func gameDetermine(cpu: String, user: String, _ gameMode: Bool) -> Bool {
        let RPSWin = ["👊": "🖐️", 
                      "🖐️": "✌️",
                      "✌️": "👊"]
        if cpu == user {
            return false
        }
        if RPSWin[cpu] == user {
            return true == gameMode
        } else {
            return false == gameMode
        }
    }
    
    func answerTapped(_ userInput: String) {
        round += 1
        if gameDetermine(cpu: RPSs[currentRPSIndex], user: userInput, currentGameMode) {
            rightTimes += 1
            score += 1
        } else {
            wrongTimes += 1
            score -= 1
        }
        if round == roundMax {
            stars = starRate()
            scoreBoardShow = true
        }
        newQuestion()
    }
    
    func starRate() -> String {
        let rate = Double(rightTimes)/Double(roundMax)
        let stars = Int(rate * 5)
        var result = ""
        for _ in (0..<stars) {
            result += "⭐️"
        }
        if result == "" {
            result = "..."
        }
        return result
        
    }
    
    func newQuestion() {
        currentRPSIndex = Int.random(in: 0...2)
        if randomMode {
            currentGameMode = Bool.random()
        } else {
            currentGameMode.toggle()
        }
    }
    
    func resetGame() {
        score = 0
        rightTimes = 0
        wrongTimes = 0
        stars = ""
        round = 0
        newQuestion()
    }
}

#Preview {
    ContentView()
}
