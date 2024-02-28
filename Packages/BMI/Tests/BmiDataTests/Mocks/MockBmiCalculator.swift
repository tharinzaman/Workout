//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

final class MockBmiCalculatorSuccess: BmiCalculator {
    
    private(set) var calculateMetricBmiCalled = false
    private(set) var calculateImperialBmiCalled = false
    private(set) var calculateBmiCategoryCalled = false
    
    func calculateMetricBmi(height: Double, weight: Double) throws -> Double {
        calculateMetricBmiCalled = true
        return 24.0
    }
    
    func calculateImperialBmi(weight: Double, feet: Int, inches: Int) throws -> Double {
        calculateImperialBmiCalled = true
        return 24.0
    }
    
    func calculateBmiCategory(bmi: Double) throws -> BmiCategory {
        calculateBmiCategoryCalled = true
        return .healthy
    }

}

final class MockBmiCalculatorInvalidHeight: BmiCalculator {
    
    private(set) var calculateMetricBmiCalled = false
    private(set) var calculateImperialBmiCalled = false
    private(set) var calculateBmiCategoryCalled = false
    
    func calculateMetricBmi(height: Double, weight: Double) throws -> Double {
        calculateMetricBmiCalled = true
        throw BmiError.invalidHeightPassed
    }
    
    func calculateImperialBmi(weight: Double, feet: Int, inches: Int) throws -> Double {
        calculateImperialBmiCalled = true
        throw BmiError.invalidHeightPassed
    }
    
    func calculateBmiCategory(bmi: Double) throws -> BmiCategory {
        calculateBmiCategoryCalled = true
        throw BmiError.invalidBmiPassed
    }

}

final class MockBmiCalculatorInvalidWeight: BmiCalculator {
    
    private(set) var calculateMetricBmiCalled = false
    private(set) var calculateImperialBmiCalled = false
    private(set) var calculateBmiCategoryCalled = false
    
    func calculateMetricBmi(height: Double, weight: Double) throws -> Double {
        calculateMetricBmiCalled = true
        throw BmiError.invalidWeightPassed
    }
    
    func calculateImperialBmi(weight: Double, feet: Int, inches: Int) throws -> Double {
        calculateImperialBmiCalled = true
        throw BmiError.invalidWeightPassed
    }
    
    func calculateBmiCategory(bmi: Double) throws -> BmiCategory {
        calculateBmiCategoryCalled = true
        throw BmiError.invalidBmiPassed
    }

}
