//
//  ContentView.swift
//  FunMultiplication
//
//  Created by Shawn on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var questionLevel = 2
    @State private var questionAmount = 5
    private let questionRange = [5,10,20]
    @State private var questions: [Question] = []
    @State private var currentQuestionNumber = 0
    @State var userInput: String = ""
    @State var allowSetting = true
    @State var settingMode = true
    @State var score = 0
    @State var thumbScaled = false
    @State var currentCorrection = true
    @State var attempts: Int = 0
    @State private var showingScore = false
    
    struct Question {
        let firstMultiplier: Int
        let secondMultiplier: Int
        var answer : Int {
            firstMultiplier*secondMultiplier
        }
        var questionText: String {
            "What is \(firstMultiplier) x \(secondMultiplier) ?"
        }
        
    }
    
    struct Shake: GeometryEffect {
        var amount: CGFloat = 10
        var shakesPerUnit = 3
        var animatableData: CGFloat

        func effectValue(size: CGSize) -> ProjectionTransform {
            ProjectionTransform(CGAffineTransform(translationX:
                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                y: 0))
        }
    }
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack{
                VStack {
                    HStack{
                        Text(settingMode ? "Select Level: \(questionLevel)" : "Question Level: \(questionLevel)")
                            .foregroundStyle(settingMode ? .white : .black)
                        Stepper("", value: $questionLevel, in: 2...12, step: 1)
                            .disabled(!settingMode)
                    }
                    
                        
                    Picker("Pick question amount", selection: $questionAmount){
                        ForEach(questionRange, id: \.self){i in
                            Text("\(i)")
                        }
                    }
                    .pickerStyle(.palette)
                    .disabled(!settingMode)
                    
                    ZStack{
                        Button("Start Game"){
                            settingMode = false
                            questions = generateQuestions(questionAmount)
                            currentQuestionNumber = 0
                        }.opacity(settingMode ? 1 : 0)
                        Button("Back to setting"){
                            questions = []
                            settingMode = true
                        }.opacity(settingMode ? 0 : 1)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    Text(questions.count>0 ? questions[currentQuestionNumber].questionText : " ")
                        .padding()
                        .font(.title)
                    
                    
                    ZStack{
                        HStack{
                            Text(userInput.count==0 ? " " : "\(userInput)")
                                .padding()
                                .frame(width: 100, height: 40)
                                .background(.gray)
                        }
                        HStack{
                            Spacer()
                            Spacer()
                            Spacer()
                            Button("👍") {
                                if !settingMode && userInput.count != 0 {
                                    submitAnswer(currentQuestionNumber ,answer: userInput)
                                    if currentQuestionNumber < questionAmount-1 {
                                        currentQuestionNumber+=1
                                    } else {
                                        showingScore = true
                                        questions = []
                                        settingMode = true
                                    }
                                    if currentCorrection {
                                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                                            thumbScaled.toggle()
                                        }
                                    } else {
                                        withAnimation(.default) {
                                            attempts += 1
                                        }
                                    }
                                } else {
                                    withAnimation(.default) {
                                        attempts += 1
                                    }
                                }
                                
                                userInput = ""
                            }
                            .font(.system(size: 20))
                            .padding(7)
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(.circle)
                            .scaleEffect(thumbScaled ? 5.0 : 1.0)
                            .scaleEffect(thumbScaled ? 0.2 : 1.0)
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                            Spacer()
                        }
                    }
                    NumberPad{ number in
                        switch number {
                        case 0...10:
                            if userInput.count < 3 {
                                userInput += "\(number)"
                            } else {
                                // only allow enter three number
                            }
                        case -2:
                            userInput = ""
                        default:
                            break
                        }
                    }.padding(10)
                }
                .padding()
            }
            .alert("End of the game", isPresented: $showingScore) {
                Button("Continue") {
                    score = 0
                }
            } message: {
                Text("Your score is \(score) out of \(questionAmount)")
            }
        }
    }
    
    func generateQuestions(_ questionAmount: Int) -> [Question] {
        var outputQuestions: [Question] = []
        for _ in 0...questionAmount{
            let firstMultiplier = Int.random(in: 1...questionLevel)
            let secondMulfiplier = Int.random(in: 1...questionLevel)
            let question = Question(firstMultiplier: firstMultiplier, secondMultiplier: secondMulfiplier)
            outputQuestions.append(question)
        }
        return outputQuestions
    }

    func submitAnswer(_ currentQuestionNumber: Int, answer: String){
        let answerInNumber = Int(answer)
        if answerInNumber == questions[currentQuestionNumber].answer {
            currentCorrection = true
            score+=1
        } else {
            currentCorrection = false
        }
        print(score)
        
    }
}

#Preview {
    ContentView()
}
