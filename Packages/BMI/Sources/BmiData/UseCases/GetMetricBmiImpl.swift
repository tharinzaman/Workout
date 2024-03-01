//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

internal struct GetMetricBmiImpl: GetMetricBmi {
    
    private let calculator: BmiCalculator
    
    init(
        calculator: BmiCalculator
    ) {
        self.calculator = calculator
    }
    
    func execute(
        height: Double,
        weight: Double
    ) throws -> Double {
        return try calculator.calculateMetricBmi(
            height: height,
            weight: weight
        )
    }
}
