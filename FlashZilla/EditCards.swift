//
//  EditCards.swift
//  FlashZilla
//
//  Created by Eugene on 25/09/2023.
//

import SwiftUI

struct EditCards: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer",  text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                Section {
                    ForEach(cards) { card in
                        VStack(alignment: .leading) {
                            /*@START_MENU_TOKEN@*/Text(card.prompt)/*@END_MENU_TOKEN@*/
                            .font(.headline)
                                
                            Text(card.answer)
                                .foregroundColor(.secondary)
                        }
                       
                    }
                    .onDelete(perform: delete)
                }

            }
         
        }
        .navigationTitle("Edit Cards")
        .toolbar {
            Button("Done", action: done)
        }
        .listStyle(.grouped)
        .onAppear(perform: loadData)
    }
    
    func done() {
        dismiss()
    }
    
    func delete(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    func addCard() {
        
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        let card = Card(id: UUID(), prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        
        saveData()
        
        newPrompt = ""
        newAnswer = ""
        
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
            
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
