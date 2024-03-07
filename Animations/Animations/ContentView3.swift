//
//  ContentView3.swift
//  Animations
//
//  Created by Shawn on 3/6/24.
//

import SwiftUI

// Explicit animations: ask the animation to occur
struct ContentView3: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) { //ask the animation to occur
                animationAmount+=360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animationAmount), axis: (x: 0, y: 1, z: 0)
        )
    }
}

#Preview {
    ContentView3()
}
