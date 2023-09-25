//
//  ContentView.swift
//  FlashZilla
//
//  Created by Eugene on 21/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor

    var body: some View {
        HStack {
            if accessibilityDifferentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(accessibilityDifferentiateWithoutColor ? .black : .green)
        .foregroundColor(.white)
        .clipShape(Capsule())
        
            
    }
  
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
