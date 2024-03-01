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

@available(iOS 13.0, *)
final class MockAlertHelperSuccess: AlertHelper {
    
    private(set) var errorToBmiAlertCalled = false
    
    func errorToWorkoutErrorAlert(error: Error) -> AlertModel {
        errorToBmiAlertCalled = true
        return if error is NetworkError {
            AlertItem.badResponse
        } else {
            AlertItem.unableToFetchExercises
        }
    }
}

@available(iOS 13.0, *)
final class MockAlertHelperFailure: AlertHelper {
    
    private(set) var errorToBmiAlertCalled = false
    
    func errorToWorkoutErrorAlert(error: Error) -> AlertModel {
        errorToBmiAlertCalled = true
        return AlertItem.unableToFetchExercises
    }
}
