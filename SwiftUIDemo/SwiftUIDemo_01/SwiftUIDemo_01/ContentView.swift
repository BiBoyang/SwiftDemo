//
//  ContentView.swift
//  SwiftUIDemo_01
//
//  Created by Boyang on 2025/10/11.
//

import SwiftUI

struct ContentView: View {
    @GestureState var isPressed = false
    var body: some View {
        Rectangle()
            .fill(.blue)
            .frame(width: 200, height: 200)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .updating($isPressed) { _, state, _ in
                        state = true
                    }
            )
            .overlay(
                Text(isPressed ? "Pressing" : "No Pressing")
            )
    }
}

#Preview {
    ContentView()
}
