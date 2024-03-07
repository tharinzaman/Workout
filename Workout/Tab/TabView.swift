//
//  TabView.swift
//  Workout
//
//  Created by Tharin Zaman on 05/03/2024.
//

import SwiftUI
import ExercisePresentation
import BmiPresentation

struct WorkoutTabView: View {
    
    @Environment(\.modelContext) var context
    
    var body: some View {
        TabView {
            ExercisesListScreen(modelContext: context)
                .tabItem {
                    Label(
                        "Exercise",
                        systemImage: "dumbbell.fill"
                    )
                }
            BmiScreen()
                .tabItem {
                    Label(
                        "BMI",
                        systemImage: "figure"
                    )
                }
            HistoryScreen()
                .tabItem {
                    Label(
                        "History",
                        systemImage: "clock.arrow.circlepath"
                    )
                }
        }
    }
}

#Preview {
    WorkoutTabView()
}
