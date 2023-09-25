//
//  CardView.swift
//  FlashZilla
//
//  Created by Eugene on 25/09/2023.
//

import SwiftUI

// Day 91 Challenge 2
// Couldn't use a ViewModifier as they expect to return some View not Shape.
// Use an extension on Shape directly
extension Shape {
    func cardFillStyle(_ offset: CGSize) -> some View {
        fill(offset.width > 0 ? Color.green : offset.width == 0 ? Color.white : Color.red)
    }
}

struct CardView: View {
    
    let card: Card
    var removal: ((_ correct: Bool) -> Void)? = nil // this is how to add an optional? trailing closure to our CardView struct.  Add it after the initial card param
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
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
                        .cardFillStyle(offset)
                )
                .shadow(radius: 10)
            
            VStack {
                if voiceOverEnabled {
                    Text(showingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    if showingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
              
             
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5))) // small amount 1/5 of width of rotation
        .offset(x: offset.width * 5, y: 0) // * 5 to make the gesture more sensitive
        .opacity(2 - Double(abs(offset.width / 50 ))) //abs converts the -ve to +ve, to account for left swiping
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    if offset.width < 0 {
                        feedback.prepare()
                    }
                }
                .onEnded { _ in
                    var correct = true
                    if abs(offset.width) > 100 {
                        if offset.width < 0 {
                            feedback.notificationOccurred(.error)
                            correct = false
                        }
                        removal?(correct)
                    } else {
                        offset = .zero
                    }
                }
            )
        .onTapGesture {
            showingAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
