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
    
    @State var copiedHabit = Habit(title: "", description: "")
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                LazyVStack(spacing: 50) {
                    Text(habit.title)
                        .font(.title.bold())
                    
                    Text("Description:\n\(habit.description)")
                        .multilineTextAlignment(.center)
                    
                    Text("Times logged: \(copiedHabit.completionCount)")
                    
                    HStack {
                        Button {
                            if copiedHabit.completionCount > 0 {
                                copiedHabit.completionCount -= 1
                            }
                        } label: {
                            Text("-")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(50)
                                .frame(minWidth: 50)
                                .background(.red)
                                .clipShape(Circle())
                        }
                        
                        Button {
                            copiedHabit.completionCount += 1
                        } label: {
                            Text("+")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(50)
                                .frame(minWidth: 50)
                                .background(.green)
                                .clipShape(Circle())
                        }
                    }
                }
                .frame(minHeight: geo.size.height)
            }
            .onAppear(perform: {
                copiedHabit.completionCount = habit.completionCount
            })
            .onDisappear(perform: {
                copiedHabit.title = habit.title
                copiedHabit.description = habit.description
                
                if let index = habits.items.firstIndex(of: habit) {
                    habits.items[index] = copiedHabit
                }
            })
        }
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        HabitDetailsView(habits: Habits(), habit: Habit.example, copiedHabit: Habit.example)
    }
}
