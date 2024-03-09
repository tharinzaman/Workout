//
//  ExerciseTabUITest.swift
//  WorkoutUITests
//
//  Created by Tharin Zaman on 09/03/2024.
//

import XCTest

final class ExerciseTabSuccessUITest: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = true
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-networking-success":"1"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_loadAllExercises() {
        
    }
    
    func test_doBenchPresses() {
        
    }
    
}

final class ExerciseTabFailureUITest: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = true
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-networking-success":"0"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_loadAllExercises_displayAlert() {
        
    }
    
}
