//
//  ContentView.swift
//  Habiter
//
//  Created by Edwin Przeźwiecki Jr. on 19/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habits = Habits()
    
    @State private var showingAddNewHabit = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Remaining:") {
                    ForEach(habits.items, id: \.title) { item in
                        HStack {
                            VStack {
                                Text(item.title)
                                Text(String(item.completionCount))
                            }
                        }
                    }
                }
                
                Section("Done:") {
                    
                }
            }
            .navigationTitle("Habiter")
            .toolbar {
                Button {
                    showingAddNewHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
