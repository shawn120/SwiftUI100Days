//
//  ContentView.swift
//  WordScramble
//
//  Created by Shawn on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]

        var body: some View {
            List(people, id: \.self) {
                Text("Static Row")
                Text($0)
            }
            List {
                Text("Static Row")

                ForEach(people, id: \.self) {
                    Text($0)
                }
                let input = "a"
                let letters = input.components(separatedBy: " ")
                let letter = letters.randomElement()
                let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "error"
                Text(trimmed)
                
                let word = "swift"
                let checker = UITextChecker()
                let range = NSRange(location: 0, length: word.utf16.count)
                let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
                let allGood = misspelledRange.location == NSNotFound
                Text(String(allGood))
            }
               
        }
}

#Preview {
    ContentView()
}
