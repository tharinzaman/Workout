//
//  File.swift
//
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation

@available(
    iOS 13.0,
    *
)
public final class MockGenerateAlertSuccess: GenerateAlert {
    
    public init() {
    }
    
    private(
        set
    ) var executeCalled = false
    
    public func execute(
        error: Error
    ) -> AlertModel {
        executeCalled = true
        return if error as? BmiError == BmiError.invalidBmiPassed {
            AlertItem.unableToComplete
        } else {
            AlertItem.invalidHeight
        }
    }
    
}

@available(
    iOS 13.0,
    *
)
public final class MockGenerateAlertFailure: GenerateAlert {
    
    public init() {
    }
    
    private(
        set
    ) var executeCalled = false
    
    public func execute(
        error: Error
    ) -> AlertModel {
        executeCalled = true
        return AlertItem.unableToComplete
    }
    
}
