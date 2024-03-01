//
//  File.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation
import NetworkingDomain

@available(iOS 13.0, *)
struct AlertHelperImpl: AlertHelper {
    
    func errorToWorkoutErrorAlert(error: Error) -> AlertModel {
        if let networkError = error as? NetworkError {
            return switch networkError {
            case .invalidData: AlertItem.badData
            case .invalidURL: AlertItem.badUrl
            case .invalidResponse: AlertItem.badResponse
            }
        } else {
            return AlertItem.unableToFetchExercises
        }
    }
    
}
