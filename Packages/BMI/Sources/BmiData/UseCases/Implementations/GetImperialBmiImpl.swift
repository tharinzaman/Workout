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
    ) -> Double {
        return calculator.calculateImperialBmi(
            weight: weight,
            feet: feet,
            inches: inches
        )
    }
}
