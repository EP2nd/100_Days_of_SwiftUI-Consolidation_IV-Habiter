//
//  HabitDetailsView.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 20/01/2023.
//

import SwiftUI

struct HabitDetailsView: View {
    
    @ObservedObject var habit: Habits
    
    let title: String
    let description: String
    let completionCount: Int
    
    var body: some View {
        NavigationView {
            
        }
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailsView(habit: Habits(), title: "", description: "", completionCount: 0)
    }
}
