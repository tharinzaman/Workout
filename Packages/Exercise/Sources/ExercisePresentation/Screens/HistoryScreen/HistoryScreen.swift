//
//  HistoryScreen.swift
//  Workout
//
//  Created by Tharin Zaman on 07/03/2024.
//

import SwiftUI
import SwiftData
import ExerciseDomain

@available(iOS 17, *)
public struct HistoryScreen: View {
    
    @Query(sort:\Record.timestamp) var records: [Record]
    
    public init() {}
        
    public var body: some View {
        NavigationStack {
            List {
                ForEach(records) { record in
                    RecordCell(record: record)
                }
            }
            .navigationTitle("Workouts")
            .overlay {
                if records.isEmpty {
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

@available(iOS 17, *)
struct RecordCell: View {
    
    let record: Record
    
    var body: some View {
        HStack(alignment: .center) {
            Text(
                record.timestamp.formatted(date: .numeric, time: .standard)
            )
            .frame(width: 100, alignment: .leading)
            Text(
                record.exerciseName
                    .capitalized
            )
            .frame(width: 100, alignment: .center)
            Text(
                record.duration
            )
            .frame(width: 100, alignment: .trailing)
        }
    }
}
