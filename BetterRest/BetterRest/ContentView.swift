//
//  ContentView.swift
//  BetterRest
//
//  Created by Shawn on 9/25/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
        
    @State private var ideaTime = "Error"
    
    var body: some View {
        NavigationStack {
            Form {
                // different style to choose from:
                // 1. use section title (header)
                Section (header: Text("When do you want to wake up?")
                    .font(.headline).textCase(.none))
                {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: wakeUp, calculateBedtime)
                }
                
                // 2. OR use VStack with Text view as title
                Section {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            .onChange(of: sleepAmount, calculateBedtime)
                    }
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Daily coffee intake")
                            .font(.headline)
                        Stepper(coffeeAmount <= 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 0...20)
                            .onChange(of: coffeeAmount, calculateBedtime)
                    }
                }
                
                // if use picker:
                Section {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Daily coffee intake")
                            .font(.headline)
                        Picker("Daily coffee intake", selection: $coffeeAmount) {
                            // https://stackoverflow.com/questions/59082927/swiftui-foreach-open-vs-closed-range
                            ForEach(0..<21) {
                                Text($0 <= 1 ? "\($0) cup" : "\($0) cups")
                            }
                        }
                        .onChange(of: coffeeAmount, calculateBedtime)
                    }
                }
                VStack {
                    Text("Your idea bed time is ...")
                    HStack{
                        Spacer()
                        Text(ideaTime)
                            .font(.largeTitle.bold())
                        Spacer()
                    }
                }
                .padding()
            }
            .navigationTitle("BetterRest")
            .onAppear {
                calculateBedtime()
            }
//                        .toolbar {
//                            Button("Calculate", action: calculateBedtime)
//                        }
//                        .alert(alertTitle, isPresented: $showingAlert){
//                            Button("OK") { }
//                        } message: {
//                            Text(alertMessage)
//                        }
        }
        
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Error"
        }
        showingAlert = true
        ideaTime = alertMessage
    }
    
}

#Preview {
    ContentView()
}
