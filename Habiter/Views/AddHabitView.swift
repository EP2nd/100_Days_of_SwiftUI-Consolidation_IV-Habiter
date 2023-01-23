//
//  AddHabitView.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 20/01/2023.
//

import SwiftUI

struct AddHabitView: View {
    
    @ObservedObject var habits: Habits
    
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Title") {
                    TextField("", text: $title)
                }
                
                Section("Description") {
                    TextField("", text: $description)
                }
                .navigationTitle("Add a new habit")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                        guard trimmedTitle.isEmpty == false else { return }
                        
                        let item = Habit(title: trimmedTitle, description: description)
                        habits.items.append(item)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
