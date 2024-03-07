//
//  ExerciseScreenViewModelTest.swift
//  
//
//  Created by Tharin Zaman on 05/03/2024.
//

import XCTest
import SwiftUI
@testable import ExercisePresentation

@available(iOS 17.0, *)
final class ExerciseScreenViewModelTest: XCTestCase {
    
    @Environment(\.modelContext) var context
    
    private var vm: ExerciseScreenViewModel!
    
    override func setUp() {
        vm = ExerciseScreenViewModel(modelContext: context)
    }
    
    override func tearDown() {
        vm = nil
    }

    func test_startWorkout_success() {
        // ASSIGN
        // ACT
        vm.startWorkout()
        // ASSERT
        XCTAssertTrue(vm.workoutStarted)
        XCTAssertTrue(vm.workoutRunning)
        XCTAssertFalse(vm.workoutPaused)
        XCTAssertFalse(vm.workoutEnded)
    }
    
    func test_pauseWorkout_success() {
        // ASSIGN
        // ACT
        vm.startWorkout()
        vm.pauseWorkout()
        // ASSERT
        XCTAssertTrue(vm.workoutStarted)
        XCTAssertFalse(vm.workoutRunning)
        XCTAssertTrue(vm.workoutPaused)
        XCTAssertFalse(vm.workoutEnded)
    }
    
    func test_resumeWorkout_success() {
        // ASSIGN
        // ACT
        vm.startWorkout()
        vm.pauseWorkout()
        vm.resumeWorkout()
        // ASSERT
        XCTAssertTrue(vm.workoutStarted)
        XCTAssertTrue(vm.workoutRunning)
        XCTAssertFalse(vm.workoutPaused)
        XCTAssertFalse(vm.workoutEnded)
    }
    
    func test_endWorkout_success() {
        // ASSIGN
        // ACT
        vm.startWorkout()
        vm.endWorkout()
        // ASSERT
        XCTAssertFalse(vm.workoutStarted)
        XCTAssertFalse(vm.workoutRunning)
        XCTAssertFalse(vm.workoutPaused)
        XCTAssertTrue(vm.workoutEnded)
    }

}
