//
//  File.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import BmiDomain
import BmiPresentation
import Alerts

@available(iOS 13.0, *)
final class MockAlertHelperSuccess: AlertHelper {
    
    private(set) var errorToBmiAlertCalled = false
    
    func errorToAlert(error: Error) -> AlertModel {
        errorToBmiAlertCalled = true
        return if error as? BmiError == BmiError.invalidBmiPassed {
            BmiAlertItem.unableToComplete
        } else {
            BmiAlertItem.invalidHeight
        }
    }
}

@available(iOS 13.0, *)
final class MockAlertHelperFailure: AlertHelper {
    
    private(set) var errorToBmiAlertCalled = false
    
    func errorToAlert(error: Error) -> AlertModel {
        errorToBmiAlertCalled = true
        return BmiAlertItem.unableToComplete
    }
}
