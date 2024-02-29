//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

public final class MockGetMetricBmiSuccess: GetMetricBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    public func execute(height: Double, weight: Double) throws -> Double {
        executeCalled = true
        return 21.0
    }
    
}

public final class MockGetMetricBmiInvalidHeight: GetMetricBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    public func execute(height: Double, weight: Double) throws -> Double {
        executeCalled = true
        throw BmiError.invalidHeightPassed
    }
    
}

public final class MockGetMetricBmiInvalidWeight: GetMetricBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    public func execute(height: Double, weight: Double) throws -> Double {
        executeCalled = true
        throw BmiError.invalidWeightPassed
    }
    
}
