//
//  File.swift
//  
//
//  Created by Tharin Zaman on 25/02/2024.
//

import Foundation

public protocol BmiCalculator {
    
    func calculateMetricBmi(
        height: Double,
        weight: Double
    ) throws -> Double
    
    func calculateImperialBmi(
        weight: Double,
        feet: Int,
        inches: Int
    ) throws -> Double
    
    func calculateBmiCategory(
        bmi: Double
    ) throws -> BmiCategory
}
