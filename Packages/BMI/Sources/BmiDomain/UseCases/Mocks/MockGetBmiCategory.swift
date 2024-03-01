//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

public final class MockGetBmiCategorySuccess: GetBmiCategory {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(bmi: Double) throws -> BmiCategory {
        executeCalled = true
        return .healthy
    }
    
}

public final class MockGetBmiCategoryFailure: GetBmiCategory {
    
    public init() {}
    
    public private(set) var executeCalled = false

    public func execute(bmi: Double) throws -> BmiCategory {
        executeCalled = true
        throw BmiError.invalidBmiPassed
    }
    
}
