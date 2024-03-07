//
//  TabView.swift
//  Workout
//
//  Created by Tharin Zaman on 05/03/2024.
//

import SwiftUI
import ExercisePresentation
import BmiPresentation
import NotificationsDomain
import NotificationsData

struct WorkoutTabView: View {
    
    @StateObject var vm: WorkoutTabViewViewModel
        
    @Environment(
        \.modelContext
    ) var context
    
    init() {
        _vm = StateObject(
            wrappedValue: WorkoutTabViewViewModel(
                registerNotification: NotificationsDataResolver.shared.resolve(
                    RegisterNotification.self
                )
            )
        )
    }
    
    var body: some View {
        TabView {
            ExercisesListScreen(
                modelContext: context
            )
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
        }.onAppear {
            vm.registerNotificationForWorkout()
        }
    }
}
