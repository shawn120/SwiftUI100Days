//
//  ContentView.swift
//  Animations
//
//  Created by Shawn on 10/7/23.
//

import SwiftUI

// Implicit animations and customizing animations
struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
//            animationAmount+=1
//            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount-1)*3)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2-animationAmount)
                .animation(
                    .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount)
        )
        .onAppear{
            animationAmount = 2
        }
//        .animation(.default, value: animationAmount) // provide a default (you can also change it into linear or spring, or other built-in method) animation when animationAmount change
//        .animation(
//            .easeInOut(duration:2)
//                .delay(1),
//            value: animationAmount
//        )
        
    }
}

#Preview {
    ContentView()
}
