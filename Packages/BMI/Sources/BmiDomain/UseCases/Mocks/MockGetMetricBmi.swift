//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation

public final class MockGetMetricBmiSuccess: GetMetricBmi {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(height: Double, weight: Double) throws -> Double {
        executeCalled = true
        return 24.0
    }
    
}

public final class MockGetMetricBmiInvalidHeight: GetMetricBmi {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(height: Double, weight: Double) throws -> Double {
        executeCalled = true
        throw BmiError.invalidHeightPassed
    }
    
}

public final class MockGetMetricBmiInvalidWeight: GetMetricBmi {
    
    public init() {}
    
    public private(set) var executeCalled = false
    
    public func execute(height: Double, weight: Double) throws -> Double {
        executeCalled = true
        throw BmiError.invalidWeightPassed
    }
    
}
