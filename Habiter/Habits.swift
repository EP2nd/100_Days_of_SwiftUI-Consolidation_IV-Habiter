//
//  Habits.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 19/01/2023.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            if let encodedHabits = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedHabits, forKey: "habits")
            }
        }
    }
    
    var remainingHabits: [Habit] {
        items.filter { $0.isCompleted == false }
    }
    
    var completedHabits: [Habit] {
        items.filter { $0.isCompleted }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                items = decodedHabits
                return
            }
        }
        items = []
    }
}
