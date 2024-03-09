//
//  File.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import BmiDomain
import Alerts

@available(iOS 13.0, *)
struct BmiAlertHelperImpl: AlertHelper {
    
    func errorToAlert(error: Error) -> AlertModel {
        if let bmiError = error as? BmiError {
            return switch bmiError {
            case .invalidBmiPassed: BmiAlertItem.unableToComplete
            case .invalidHeightPassed: BmiAlertItem.invalidHeight
            case .invalidWeightPassed: BmiAlertItem.invalidWeight
            }
        } else {
            return BmiAlertItem.unableToComplete
        }
    }
    
}
