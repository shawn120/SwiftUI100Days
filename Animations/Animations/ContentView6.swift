//
//  ContentView6.swift
//  Animations
//
//  Created by Shawn on 3/14/24.
//

import SwiftUI

// trasitions
struct ContentView6: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack{
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
    }
}

#Preview {
    ContentView6()
}
