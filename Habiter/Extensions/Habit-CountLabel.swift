//
//  Habit-CountLabel.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 23/01/2023.
//

import Foundation
import SwiftUI

extension View {
    func color(for habit: Habit) -> Color {
        switch habit.completionCount {
        case 0:
            return .gray
        case 1:
            return .green
        case 2..<6:
            return .blue
        case 6..<11:
            return .purple
        default:
            return .orange
        }
    }
}
