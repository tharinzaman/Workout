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
    ) -> Double
    
    func calculateImperialBmi(
        height: Double,
        weight: Double
    ) -> Double
    
    func calculateBmiCategory(
        bmi: Double
    ) -> BmiCategory
}
