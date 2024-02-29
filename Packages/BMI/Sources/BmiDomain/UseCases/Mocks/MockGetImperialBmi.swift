//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

public final class MockGetImperialBmiSuccess: GetImperialBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    public func execute(weight: Double, feet: Int, inches: Int) throws -> Double {
        executeCalled = true
        return 24.0
    }
    
}

public final class MockGetImperialBmiInvalidHeight: GetImperialBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    public func execute(weight: Double, feet: Int, inches: Int) throws -> Double {
        executeCalled = true
        throw BmiError.invalidHeightPassed
    }
    
}

public final class MockGetImperialBmiInvalidWeight: GetImperialBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    public func execute(weight: Double, feet: Int, inches: Int) throws -> Double {
        executeCalled = true
        throw BmiError.invalidWeightPassed
    }
    
}
