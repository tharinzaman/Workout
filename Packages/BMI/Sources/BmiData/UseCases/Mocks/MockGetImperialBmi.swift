//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

final class MockGetImperialBmiSuccess: GetImperialBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    func execute(weight: Double, feet: Int, inches: Int) throws -> Double {
        executeCalled = true
        return 21.0
    }
    
}

final class MockGetImperialBmiInvalidHeight: GetImperialBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    func execute(weight: Double, feet: Int, inches: Int) throws -> Double {
        executeCalled = true
        throw BmiError.invalidHeightPassed
    }
    
}

final class MockGetImperialBmiInvalidWeight: GetImperialBmi {
    
    public init() {}
    
    private(set) var executeCalled = false
    
    func execute(weight: Double, feet: Int, inches: Int) throws -> Double {
        executeCalled = true
        throw BmiError.invalidWeightPassed
    }
    
}
