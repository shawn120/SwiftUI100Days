//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shawn on 9/22/23.
//

import SwiftUI

// how to create custom modifiers
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}
// make it easy to use
extension View {
    func myTitle() -> some View {
        modifier(Title())
    }
}

// example 2
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

// custom container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    // ^ make swift can automatically create an implicit horizontal stack inside

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    // View composition (view wrap up)
    struct CapsuleText: View {
        var text: String

        var body: some View {
            Text(text)
                .myTitle()
            Text("Test")
        }
    }
    
    // custom binding-create variables
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false
    
    var body: some View {
        // use view wrap up and custom modifiers
        VStack(spacing: 10) {
            CapsuleText(text: "First")
        }
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Shawn")
        
        // custom binding-apply
        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )
        VStack() {
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreedToAll)
        }
        
        // use custom container
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
        GridStack(rows: 3, columns: 3) {_,_ in
            Text("text")
        }
    }
}

#Preview {
    ContentView()
}
