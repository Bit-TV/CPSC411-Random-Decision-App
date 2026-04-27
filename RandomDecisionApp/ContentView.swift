import SwiftUI

struct ContentView: View {
    // 1. Storage for your choices
    @State private var choices: [String] = []
    @State private var newChoiceText = ""
    @State private var winningChoice = ""

    var body: some View {
        NavigationView {
            VStack {
                // 2. Input Section
                HStack {
                    TextField("Enter an option (e.g. Pizza)", text: $newChoiceText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        if !newChoiceText.isEmpty {
                            choices.append(newChoiceText)
                            newChoiceText = "" // Clear the field
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
                .padding()

                // 3. The "Summary View" (Your List)
                List {
                    ForEach(choices, id: \.self) { choice in
                        Text(choice)
                    }
                    .onDelete(perform: deleteChoice) // Allows swiping to delete
                }

                // 4. The Decision Logic
                if !winningChoice.isEmpty {
                    Text("The winner is: \(winningChoice)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding()
                }

                Button(action: pickRandom) {
                    Text("Decide For Me!")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(choices.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(choices.isEmpty) // Button won't work if list is empty
                .padding()
            }
            .navigationTitle("Decider")
            .toolbar {
                EditButton() // Standard iOS edit button for the list
            }
        }
    }

    // Helper functions
    func pickRandom() {
        if let random = choices.randomElement() {
            winningChoice = random
        }
    }

    func deleteChoice(at offsets: IndexSet) {
        choices.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
