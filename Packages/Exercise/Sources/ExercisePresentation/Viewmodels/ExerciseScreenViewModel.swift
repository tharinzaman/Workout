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
    
    @Published var workoutSeconds: Int = 0
    @Published var workoutMinutes: Int = 0
    @Published var workoutHours: Int = 0
    
    @Published var shouldPresentExercise: Bool = false
    
    private var timer: Timer? = nil
    
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
        self.workoutStarted = false
        stopTimer()
        // TODO: Store in database - here before you reset the time.
        resetTime()
    }
    
    func durationToString(_ duration: Int) -> String {
        if duration < 10 {
            return "0\(duration)"
        } else {
            return String(duration)
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if self.workoutSeconds == 59 {
                self.workoutSeconds = 0
                if self.workoutMinutes == 59 {
                    self.workoutMinutes = 0
                    self.workoutHours = self.workoutHours + 1
                } else {
                    self.workoutMinutes = self.workoutMinutes + 1
                }
            } else {
                self.workoutSeconds = self.workoutSeconds + 1
            }
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
    }
}
