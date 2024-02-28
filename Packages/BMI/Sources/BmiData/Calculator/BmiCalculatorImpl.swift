//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

internal struct BmiCalculatorImpl: BmiCalculator {
    
    
    func calculateMetricBmi(height: Double, weight: Double) throws -> Double {
        guard weight >= 0 else {
            throw BmiError.invalidWeightPassed
        }
        guard height >= 0 else {
            throw BmiError.invalidHeightPassed
        }
        return (weight / (height * height)).rounded()
    }
    
    func calculateImperialBmi(weight: Double, feet: Int, inches: Int) throws -> Double {
        let height = (feet * 12) + inches
        guard weight >= 0 else {
            throw BmiError.invalidWeightPassed
        }
        guard height >= 0 else {
            throw BmiError.invalidHeightPassed
        }
        return ((weight / Double((height * height))) * 703).rounded()
    }
    
    func calculateBmiCategory(bmi: Double) throws -> BmiCategory {
        guard bmi > 0 else {
            throw BmiError.invalidBmiPassed
        }
        return switch bmi {
        case 0..<18.5: .underweight
        case 18.5..<25.0: .healthy
        case 25.0..<30.0: .overweight
        case 30.0..<1000: .obese
        default: BmiCategory.invalid
        }
    }
    
}
