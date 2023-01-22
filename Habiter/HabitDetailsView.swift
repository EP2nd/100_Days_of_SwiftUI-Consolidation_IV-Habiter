//
//  HabitDetailsView.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 20/01/2023.
//

import SwiftUI

struct HabitDetailsView: View {
    
    @ObservedObject var habits: Habits
    
    var habit: Habit
    
    @State private var completionCount = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Text(habit.title)
                    .font(.title.bold())
                
                Text("Description:\n\(habit.description)")
                    .multilineTextAlignment(.center)
                
                Text("Times logged: \(habit.completionCount)")
                
                HStack {
                    
                    Button {
                        var newActivity = habit
                        newActivity.completionCount -= 1
                        
                        if let index = habits.items.firstIndex(of: habit) {
                            habits.items[index] = newActivity
                        }
                    } label: {
                        Image(systemName: "minus")
                    }
                    
                    Button {
                        var newActivity = habit
                        newActivity.completionCount += 1
                        
                        if let index = habits.items.firstIndex(of: habit) {
                            habits.items[index] = newActivity
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .padding()
            }
            .padding(.top)
        }
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        HabitDetailsView(habits: Habits(), habit: Habit.example)
    }
}
