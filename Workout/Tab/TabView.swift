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
    var body: some View {
        TabView {
            ExercisesListScreen()
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
        }
    }
}

#Preview {
    WorkoutTabView()
}
