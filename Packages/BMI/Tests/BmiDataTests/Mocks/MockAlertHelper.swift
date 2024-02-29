//
//  File.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import BmiDomain

@available(iOS 13.0, *)
final class MockAlertHelperSuccess: AlertHelper {
    
    private(set) var errorToBmiAlertCalled = false
    
    func errorToBmiErrorAlert(error: Error) -> AlertModel {
        errorToBmiAlertCalled = true
        return AlertItem.invalidHeight
    }
}

@available(iOS 13.0, *)
final class MockAlertHelperFailure: AlertHelper {
    
    private(set) var errorToBmiAlertCalled = false
    
    func errorToBmiErrorAlert(error: Error) -> AlertModel {
        errorToBmiAlertCalled = true
        return AlertItem.unableToComplete
    }
}
