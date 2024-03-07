//
//  File.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation
import ExerciseDomain
import SwiftData

@available(
    iOS 17.0,
    *
)
final class ExerciseScreenViewModel: ObservableObject {
        
    @Published var workoutStarted: Bool = false
    @Published var workoutRunning: Bool = false
    @Published var workoutPaused: Bool = false
    @Published var workoutEnded: Bool = false
    
    @Published var workoutSeconds: Int = 0
    @Published var workoutMinutes: Int = 0
    @Published var workoutHours: Int = 0
    @Published var workoutDurationString: String = "00:00:00"
    
    @Published var selectedExercise: Exercise = Exercise.failedExercise
    @Published var shouldPresentExercise: Bool = false
    
    private var timer: Timer? = nil
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func startWorkout() {
        self.workoutStarted = true
        self.workoutRunning = true
        startTimer()
    }
    
    func pauseWorkout() {
        self.workoutRunning = false
        self.workoutPaused = true
        stopTimer()
    }
    
    func resumeWorkout() {
        self.workoutPaused = false
        self.workoutRunning = true
        startTimer()
    }
    
    func endWorkout() {
        self.workoutRunning = false
        self.workoutEnded = true
        stopTimer()
        saveToDatabase()
        resetTime()
        self.workoutStarted = false
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true
        ) { [self]_ in
            if workoutSeconds == 59 {
                workoutSeconds = 0
                if workoutMinutes == 59 {
                    workoutMinutes = 0
                    workoutHours = workoutHours + 1
                } else {
                    workoutMinutes = workoutMinutes + 1
                }
            } else {
                workoutSeconds = workoutSeconds + 1
            }
            workoutDurationString = "\(workoutHours.durationToString()):\(workoutMinutes.durationToString()):\(workoutSeconds.durationToString())"
            
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func resetTime() {
        self.workoutHours = 0
        self.workoutMinutes = 0
        self.workoutSeconds = 0
        self.workoutDurationString = "00:00:00"
    }
    
    private func saveToDatabase() {
        if workoutStarted {
            let record = Record(
                exerciseName: selectedExercise.exercise,
                timestamp: Date.now,
                duration: workoutDurationString
            )
            modelContext.insert(record)
        }
    }
}
