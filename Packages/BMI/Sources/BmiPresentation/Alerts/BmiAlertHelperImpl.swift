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
    
    func errorToAlert(error: Error) -> Alerts.AlertModel {
        <#code#>
    }
    
    
    func errorToBmiErrorAlert(error: Error) -> AlertModel {
        if let bmiError = error as? BmiError {
            return switch bmiError {
            case .invalidBmiPassed: AlertItem.unableToComplete
            case .invalidHeightPassed: AlertItem.invalidHeight
            case .invalidWeightPassed: AlertItem.invalidWeight
            }
        } else {
            return AlertItem.unableToComplete
        }
    }
    
}
