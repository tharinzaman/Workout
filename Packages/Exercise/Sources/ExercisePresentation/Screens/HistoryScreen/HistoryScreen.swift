//
//  HistoryScreen.swift
//  Workout
//
//  Created by Tharin Zaman on 07/03/2024.
//

import SwiftUI
import SwiftData

struct HistoryScreen: View {
    
    var workouts: [WorkoutRecord] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(workouts) { workout in
                    Text(workout.workoutName)
                }
            }
            .navigationTitle("Workouts")
            .overlay {
                if workouts.isEmpty {
                    ContentUnavailableView {
                        Label(
                            "No Recorded Workouts",
                            systemImage: "figure.run.circle.fill"
                        )
                    } description: {
                        Text(
                            "Start doing some workouts"
                        )
                    }
                }
            }
        }
    }
}

struct WorkoutCell: View {
    
    let record: WorkoutRecord
    
    var body: some View {
        HStack {
            Text(
                record.timestamp,
                format: .dateTime
                    .month(
                        .abbreviated
                    ).day(
                        .twoDigits
                    ).year()
                    .hour(
                        .twoDigits(amPM: .abbreviated)
                    ).minute(
                        .twoDigits
                    ).second(
                        .twoDigits
                    )
            )
            .frame(width: 70, alignment: .leading)
            Text(record.workoutName)
            Text(String(record.duration)) // Need a method in viewmodel to convert to readable time, like we do in our other viewmodel
        }
    }
}

#Preview {
    HistoryScreen()
}
