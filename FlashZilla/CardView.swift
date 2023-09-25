//
//  CardView.swift
//  FlashZilla
//
//  Created by Eugene on 25/09/2023.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    var removal: (() -> Void)? = nil // this is how to add an optional? trailing closure to our CardView struct.  Add it after the initial card param
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @State private var showingAnswer = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor
                    ? .white
                    : .white.opacity(1 - Double(abs(offset.width / 50 ))) // 1 - means colour will kick in straightaway

                )
                .background(
                    differentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                if showingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
             
            }
            
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5))) // small amount 1/5 of width of rotation
        .offset(x: offset.width * 5, y: 0) // * 5 to make the gesture more sensitive
        .opacity(2 - Double(abs(offset.width / 50 ))) //abs converts the -ve to +ve, to account for left swiping
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                       removal?()
                    } else {
                        offset = .zero
                    }
                }
            )
        .onTapGesture {
            showingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
