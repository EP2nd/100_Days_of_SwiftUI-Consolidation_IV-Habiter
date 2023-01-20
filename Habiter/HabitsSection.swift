//
//  HabitsSection.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 20/01/2023.
//

import SwiftUI

struct HabitsSection: View {
    
    let habits: [Habit]
    
    let sectionTitle: String
    
    let deleteHabit: (IndexSet) -> Void
    
    var body: some View {
        Section(sectionTitle) {
            ForEach(habits, id: \.title) { item in
                HStack {
                    Text(item.title)
                    
                    Spacer()
                    
                    Text(String(item.completionCount))
                }
            }
            .onDelete(perform: deleteHabit)
        }
    }
}

struct HabitsSection_Previews: PreviewProvider {
    static var previews: some View {
        HabitsSection(habits: [], sectionTitle: "", deleteHabit: { _ in } )
    }
}
