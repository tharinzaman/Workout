//
//  File.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation
import NetworkingDomain
import Alerts

@available(iOS 13.0, *)
struct ExerciseAlertHelperImpl: AlertHelper {
    
    func errorToAlert(error: Error) -> AlertModel {
        if let networkError = error as? NetworkError {
            return switch networkError {
            case .invalidData: ExerciseAlertItem.badData
            case .invalidURL: ExerciseAlertItem.badUrl
            case .invalidResponse: ExerciseAlertItem.badResponse
            }
        } else {
            return ExerciseAlertItem.unableToFetchExercises
        }
    }
    
}
