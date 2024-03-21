//
//  NumberPad.swift
//  FunMultiplication
//
//  Created by Shawn on 3/18/24.
//

import SwiftUI

struct buttonPad: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 50))
            .padding(7)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(.circle)
            .padding(5)
    }
    
}

extension View {
    func myButtonPad() -> some View {
        modifier(buttonPad())
    }
}

struct NumberPad: View {
    let buttonTapped: (Int) -> Void
    
    var body: some View {
        VStack{
            HStack{
                Button("1️⃣"){
                    buttonTapped(1)
                }
                .myButtonPad()
                Button("2️⃣"){
                    buttonTapped(2)
                }
                .myButtonPad()
                Button("3️⃣"){
                    buttonTapped(3)
                }
                .myButtonPad()
            }
            HStack{
                Button("4️⃣"){
                    buttonTapped(4)
                }
                .myButtonPad()
                Button("5️⃣"){
                    buttonTapped(5)
                }
                .myButtonPad()
                Button("6️⃣"){
                    buttonTapped(6)
                }
                .myButtonPad()
            }
            HStack{
                Button("7️⃣"){
                    buttonTapped(7)
                }
                .myButtonPad()
                Button("8️⃣"){
                    buttonTapped(8)
                }
                .myButtonPad()
                Button("9️⃣"){
                    buttonTapped(9)
                }
                .myButtonPad()
            }
            HStack{
                Button("✔️"){
                    buttonTapped(-1)
                }
                .myButtonPad()
                .hidden()
                Button("0️⃣"){
                    buttonTapped(0)
                }
                .myButtonPad()
                Button("❌"){
                    buttonTapped(-2)
                }
                .myButtonPad()
            }
        }
        
    }
}

#Preview {
    NumberPad{ _ in
        return
    }
}
