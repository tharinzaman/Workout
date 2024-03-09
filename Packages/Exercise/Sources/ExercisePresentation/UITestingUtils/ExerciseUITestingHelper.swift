//
//  UITestingHelper.swift
//  WorkoutUITests
//
//  Created by Tharin Zaman on 09/03/2024.
//

import Foundation

public struct ExerciseUITestingHelper {
    
    public static var isUITest: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }
    
    public static var networkingSuccess: Bool {
        ProcessInfo.processInfo.environment["-networking-success"] == "1"
    }
    
}
