//
//  ContentView.swift
//  WeConvert
//
//  Created by Shawn on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var unitFrom = "Celsius"
    @State private var unitTo = "Fahrenheit"
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @FocusState private var inputIsFocused: Bool
    
    func Unify(input: Double, unit: String) -> Double {
        if unit == "Celsius" {
            return input
        } else if unit == "Fahrenheit" {
            return (input-32)/1.8
        } else {
            return input-273.15
        }
    }
    
    var result: Double {
        let unified = Unify(input: input, unit: unitFrom)
        if unitTo == "Celsius" {
            return unified
        } else if unitTo == "Fahrenheit" {
            return unified*9/5+32
        } else {
            return unified+273.15
        }
    }
    
    var body: some View {
        NavigationView {
            Form{
                // input section
                Section {
                    HStack{
                        TextField("From", value: $input, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($inputIsFocused)
                        Picker("", selection: $unitFrom) {
                            ForEach(units, id: \.self){
                                Text($0)
                            }
                        }
                    }
                } header: {
                    Text("Convert From...").textCase(.none).bold().font(.headline)
                }
                // result section
                Section {
                    HStack{
                        Text(result.formatted())
                        Picker("", selection: $unitTo) {
                            ForEach(units, id: \.self){
                                Text($0)
                            }
                        }
                    }
                } header: {
                    Text("Result:").textCase(.none).bold().font(.headline)
                }
            }
            .navigationTitle("WeConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
