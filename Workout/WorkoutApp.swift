//
//  WorkoutApp.swift
//  Workout
//
//  Created by Tharin Zaman on 24/02/2024.
//

import SwiftUI
import SwiftData

@main
struct WorkoutApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            WelcomeScreen()
//            TestView()
            WorkoutTabView()
        }
        .modelContainer(sharedModelContainer)
    }
}
