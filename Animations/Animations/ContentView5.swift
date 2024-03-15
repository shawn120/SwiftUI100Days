//
//  ContentView5.swift
//  Animations
//
//  Created by Shawn on 3/14/24.
//

import SwiftUI

// Animating gestures
struct ContentView5: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: UnitPoint.bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{dragAmount = $0.translation}
                    .onEnded{_ in
                        withAnimation(.bouncy) { // explicit
                            dragAmount = .zero}
                    }
            )
//            .animation(.bouncy, value: dragAmount) // implicit
    }
}

#Preview {
    ContentView5()
}
