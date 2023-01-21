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
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Text(habit.title)
                    .font(.title.bold())
                
                Text("Description:\n\(habit.description)")
                    .multilineTextAlignment(.center)
                
                Text("Logged: \(habit.completionCount)")
                
                HStack {
                    Button {
                        var loggedCompletion = habit.completionCount
                        loggedCompletion -= 1
                        
                        let item = Habit(title: habit.title, description: habit.description, isCompleted: habit.isCompleted , completionCount: loggedCompletion)
                        
                        let index = habits.items.firstIndex(of: habit)
                        
                        
                        
                    } label: {
                        Image(systemName: "minus")
                    }
                    Button {
                        var loggedCompletion = habit.completionCount
                        loggedCompletion -= 2
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .padding()
            }
            .padding(.top)
        }
//        .navigationTitle(habit.title)
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        HabitDetailsView(habit: Habit(title: "", description: "", isCompleted: true, completionCount: 0))
    }
}
