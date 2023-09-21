//
//  ContentView.swift
//  FlashZilla
//
//  Created by Eugene on 21/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        
        Text("Hello, Zoom in!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
