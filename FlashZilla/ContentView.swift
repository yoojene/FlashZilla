//
//  ContentView.swift
//  FlashZilla
//
//  Created by Eugene on 21/09/2023.
//

import SwiftUI


//func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
//    if UIAccessibility.isReduceMotionEnabled {
//        return try body()
//    } else {
//        return try withAnimation(animation, body)
//    }
//}

struct ContentView: View {
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0

    var body: some View {
       
        Text("Success")
            .scaleEffect(scale)
            .onTapGesture {
                if reduceMotion {
                    scale *= 1.5
                } else {
                    withAnimation {
                        scale *= 1.5
                    }
                }
            }
       
        
            
    }
  
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
