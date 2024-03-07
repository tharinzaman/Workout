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
            .navigationTitle("Records 🕦")
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
