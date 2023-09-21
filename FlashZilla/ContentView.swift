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
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle()) // the tap gesture will work on the rectangle too
                .onTapGesture {
                    print("Circle tapped!")
                }
        }
    }
  
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
