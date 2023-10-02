//
//  ContentView.swift
//  MyTest
//
//  Created by Shawn on 9/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var property: Int = 0
    @State private var propertyB: String = "Error"
    @State private var switchTest: Bool = false
    
    func calculateProperty() -> String {
        let date = Date.now
        if property <= 2{
            return date.formatted(date: .omitted, time: .shortened)+String(property * 2)
        }
        else {
            return date.formatted(date: .omitted, time: .shortened)+String(property * 4)
        }
    }
    
    func calculatePropertyWillFail() -> String {
        let date = Date.now
        if property <= 2{
            propertyB = date.formatted(date: .omitted, time: .shortened)+String(property * 2)
        }
        else {
            propertyB = date.formatted(date: .omitted, time: .shortened)+String(property * 4)
        }
        return propertyB
    }
    
    var body: some View {
        VStack {
            Picker("Select Property", selection: $property) {
                ForEach(0 ..< 4) {
                    Text("\($0)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Button("test"){calculatePropertyWillFail()}
            Text(calculateProperty())
                .padding()
            Text(calculatePropertyWillFail())
                .padding()
            Text(propertyB)
        }
    }
}

#Preview {
    ContentView()
}
