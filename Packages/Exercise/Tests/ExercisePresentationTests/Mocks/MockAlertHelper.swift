//
//  File.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation
import ExerciseDomain
import ExercisePresentation
import NetworkingDomain
import Alerts

@available(iOS 13.0, *)
final class MockAlertHelperSuccess: AlertHelper {
    
    private(set) var errorToAlertCalled = false
    
    func errorToAlert(error: Error) -> AlertModel {
        errorToAlertCalled = true
        return if error is NetworkError {
            ExerciseAlertItem.badResponse
        } else {
            ExerciseAlertItem.unableToFetchExercises
        }
    }
}

@available(iOS 13.0, *)
final class MockAlertHelperFailure: AlertHelper {
    
    private(set) var errorToAlertCalled = false
    
    func errorToAlert(error: Error) -> AlertModel {
        errorToAlertCalled = true
        return ExerciseAlertItem.unableToFetchExercises
    }
}
