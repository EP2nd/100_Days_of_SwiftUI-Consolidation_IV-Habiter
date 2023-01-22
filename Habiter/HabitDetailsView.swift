//
//  HabitDetailsView.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 20/01/2023.
//

import SwiftUI

struct HabitDetailsView: View {
    
    @ObservedObject var habits = Habits()
    
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
                        var loggedCompletion = habit.completionCount
                        loggedCompletion -= 1
                        
                        guard let index = habits.items.firstIndex(of: habit) else { return }
                        
                        let newActivity = Habit(title: habit.title, description: habit.description, isCompleted: habit.isCompleted , completionCount: loggedCompletion)
                        
                        habits.items[index] = newActivity
                                
                    } label: {
                        Image(systemName: "minus")
                    }
                    
                    Button {
                        var loggedCompletion = habit.completionCount
                        loggedCompletion += 1
                        
                        guard let index = habits.items.firstIndex(of: habit) else { return }
                        
                        let newActivity = Habit(title: habit.title, description: habit.description, isCompleted: habit.isCompleted , completionCount: loggedCompletion)
                        
                        habits.items[index] = newActivity
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
        HabitDetailsView(habit: Habit(title: "", description: "", isCompleted: true, completionCount: 0))
    }
}
