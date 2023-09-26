//
//  ContentView.swift
//  BetterRest
//
//  Created by Shawn on 9/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
                .labelsHidden()
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.year().day().month())
            Text(Date.now.formatted(date: .omitted, time: .shortened))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
