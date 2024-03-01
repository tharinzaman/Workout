//
//  File.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation

@available(iOS 13.0, *)
final class ExerciseScreenViewModel: ObservableObject {
    
    @Published var workoutStarted: Bool = false
    @Published var workoutRunning: Bool = false
    @Published var workoutPaused: Bool = false
    @Published var workoutEnded: Bool = false
    @Published var workoutDuration: Int = 0
    @Published var shouldPresentExercise: Bool = false
    
    func startWorkout() {
        self.workoutStarted = true
        self.workoutRunning = true
    }
    
    func pauseWorkout() {
        self.workoutRunning = false
        self.workoutPaused = true
    }
    
    func resumeWorkout() {
        self.workoutRunning = true
        self.workoutPaused = false
    }
    
    func endWorkout() {
        self.workoutRunning = false
        self.workoutEnded = true
        self.workoutStarted = false
    }
}
