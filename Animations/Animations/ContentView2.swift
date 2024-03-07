//
//  ContentView2.swift
//  Animations
//
//  Created by Shawn on 3/6/24.
//

import SwiftUI

// Animating bindings
struct ContentView2: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack{
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10) //animation the change of values
            Spacer()
            Button("Tap me") {
                animationAmount += 1 // if you hit the button, no animations here
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            
        }
    }
}

#Preview {
    ContentView2()
}
