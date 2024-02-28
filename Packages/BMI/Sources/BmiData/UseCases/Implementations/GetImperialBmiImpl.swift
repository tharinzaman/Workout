//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

internal struct GetImperialBmiImpl: GetImperialBmi{
    
    private let calculator: BmiCalculator
    
    init(
        calculator: BmiCalculator
    ) {
        self.calculator = calculator
    }
    
    func execute(
        weight: Double,
        feet: Int,
        inches: Int
    ) throws -> Double {
        return try calculator.calculateImperialBmi(
            weight: weight,
            feet: feet,
            inches: inches
        )
    }
}
