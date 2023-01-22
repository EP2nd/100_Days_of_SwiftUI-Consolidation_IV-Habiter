//
//  Habit.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 19/01/2023.
//

import Foundation

struct Habit: Codable, Equatable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let isCompleted: Bool
    var completionCount = 0
}
