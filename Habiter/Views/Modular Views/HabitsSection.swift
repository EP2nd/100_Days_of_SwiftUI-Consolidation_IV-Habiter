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
    
    var sectionTitle: String
    var deleteHabit: (IndexSet) -> Void
    
    var body: some View {
        Section(sectionTitle) {
            ForEach(habit) { item in
                NavigationLink {
                    HabitDetailsView(habits: habits, habit: item)
                } label: {
                    HStack {
                        Text(item.title)
                        
                        Spacer()
                        
                        Text(String(item.completionCount))
                            .font(.title3)
                            .padding(10)
                            .frame(minWidth: 40)
                            .background(color(for: item))
                            .clipShape(Circle())
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
