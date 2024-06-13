//
//  WorkoutApp.swift
//  Workout
//
//  Created by Tharin Zaman on 24/02/2024.
//

import SwiftUI
import SwiftData
import ExerciseDomain

@main
struct WorkoutApp: App {
    
    // Test comment
    
    let container: ModelContainer = {
        let schema = Schema([Record.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()

    var body: some Scene {
        WindowGroup {
            WorkoutTabView()
        }
        .modelContainer(container)
    }
}
