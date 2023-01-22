//
//  HabitsSection.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 20/01/2023.
//

import SwiftUI

struct HabitsSection: View {
    
    @ObservedObject var habits: Habits
    
    var habit: [Habit]
//    let habit: Habit
    
    let sectionTitle: String
    
    let deleteHabit: (IndexSet) -> Void
    
    var body: some View {
        Section(sectionTitle) {
            ForEach(habit, id: \.title) { item in
                NavigationLink {
                    HabitDetailsView(habits: habits, habit: item)
                } label: {
                    HStack {
                        Text(item.title)
                        
                        Spacer()
                        
                        Text(String(item.completionCount))
                    }
                }
            }
            .onDelete(perform: deleteHabit)
        }
    }
}

struct HabitsSection_Previews: PreviewProvider {
    static var previews: some View {
        HabitsSection(habits: Habits(), habit: [], sectionTitle: "", deleteHabit: { _ in })
    }
}
