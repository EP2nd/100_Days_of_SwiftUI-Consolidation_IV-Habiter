//
//  Habit.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 19/01/2023.
//

import Foundation

struct Habit: Codable, Equatable, Identifiable {
    
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Habit(title: "Example activity", description: "Example description")
}
