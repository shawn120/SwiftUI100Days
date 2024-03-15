//
//  ContentView4.swift
//  Animations
//
//  Created by Shawn on 3/14/24.
//

import SwiftUI

// Controlling the animation stack
struct ContentView4: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enabled) // the order matters,
                                            // so you can control them separately
                                            // even an animation "disablizer"
//        .animation(nil, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.8), value: enabled)

    }
}

#Preview {
    ContentView4()
}
