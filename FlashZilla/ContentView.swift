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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onTapGesture(count: 2) {
                    print("double tapped")
                }
                .padding(.bottom)

            Text("Hello, Long press!")
                .onLongPressGesture(minimumDuration: 2) {
                    print("Long pressed")
                } onPressingChanged: { inProgress in
                    print("in progress \(inProgress)")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
