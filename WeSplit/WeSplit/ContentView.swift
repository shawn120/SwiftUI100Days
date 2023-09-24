//
//  ContentView.swift
//  WeSplit
//
//  Created by Shawn on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @FocusState private var amountIsFocused: Bool
    
    var totalBill: Double {
        let tipSelection = Double(tipPercentage)
        return checkAmount*(1+tipSelection/100)
    }
    
    var totalPerPerson: Double { // computed property
        let peopleCount = Double(numberOfPeople+2)
        return totalBill/peopleCount
    }
    
    // currencyFormatter (Challenge)
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            Form {
                // bill amount & people amount section
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormatter)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                } header: {
                    Text("Bill Amount").textCase(.none)
                }
                
                // tip section
                // 1: segmented control
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip Rate (original)").textCase(.none)
                }
                // 2: navigationLink control (challenge)
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Tip Rate (challenge)").textCase(.none)
                }
                
                // total bill section (challenge)
                Section{
                    Text(totalBill, format: currencyFormatter)
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                } header: {
                    Text("Total Bill").textCase(.none)
                }
                
                // split bill sectiom
                Section {
                    Text(totalPerPerson, format: currencyFormatter)
                } header: {
                    Text("Amount Per Person").textCase(.none)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview { // new feature in Xcode15
    ContentView()
}
