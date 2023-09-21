//
//  ContentView.swift
//  FlashZilla
//
//  Created by Eugene on 21/09/2023.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("text tapped")
                }
        }.simultaneousGesture( // to ensure parent and child gestures are called
            TapGesture().onEnded {
                print("vstack tapped")
            }
        )
        
    }

}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
