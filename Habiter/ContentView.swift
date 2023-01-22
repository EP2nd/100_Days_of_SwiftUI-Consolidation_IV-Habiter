//
//  ContentView.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 19/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habits = Habits()
    
//    @State private var habit: Habit
    
    @State private var showingAddNewHabit = false
    
    var body: some View {
        NavigationView {
            List {
                HabitsSection(habits: habits, habit: habits.remainingHabits, sectionTitle: "Remaining:", deleteHabit: removeHabit)
                
                HabitsSection(habits: habits, habit: habits.completedHabits, sectionTitle: "Done:", deleteHabit: removeHabit)
            }
            .navigationTitle("Habiter")
            .toolbar {
                Button {
                    showingAddNewHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .preferredColorScheme(.dark)
        }
        .sheet(isPresented: $showingAddNewHabit) {
            AddHabitView(habits: habits)
        }
    }
    
    func removeHabit(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
