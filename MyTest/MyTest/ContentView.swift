//
//  ContentView.swift
//  MyTest
//
//  Created by Shawn on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var propertyB: Int = 0

    func calculatePropertyA() -> String {
        let date = Date.now
//        return String(propertyB * 2)
        return date.formatted(date: .omitted, time: .shortened)+String(propertyB * 2)
    }

    var body: some View {
        VStack {
            Picker("Select Property B", selection: $propertyB) {
                ForEach(0 ..< 10) {
                    Text("\($0)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Text(calculatePropertyA())
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
