//
//  ContentView.swift
//  FlashZilla
//
//  Created by Eugene on 21/09/2023.
//

import SwiftUI


// wrapper on UIKit UIAccessibility makes the code simpler
func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0

    var body: some View {
       
        Text("Success")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    scale *= 1.5
                }
            }
        }
  
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
