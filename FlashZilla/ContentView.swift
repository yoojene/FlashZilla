//
//  ContentView.swift
//  FlashZilla
//
//  Created by Eugene on 21/09/2023.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
   
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("world")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("Vstack tapped")
        }
    }
  
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
