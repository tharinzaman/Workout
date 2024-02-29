//
//  File.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import BmiDomain

@available(iOS 13.0, *)
public final class MockGenerateAlertSuccess: GenerateAlert {
    
    private(set) var executeCalled = false
    
    public func execute(error: Error) -> AlertModel {
        executeCalled = true
        return AlertItem.invalidHeight
    }

}

@available(iOS 13.0, *)
public final class MockGenerateAlertFailure: GenerateAlert {
    
    private(set) var executeCalled = false
    
    public func execute(error: Error) -> AlertModel {
        executeCalled = true
        return AlertItem.unableToComplete
    }

}
