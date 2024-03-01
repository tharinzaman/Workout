//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain

internal struct GetBmiCategoryImpl: GetBmiCategory {
    
    private let calculator: BmiCalculator
    
    init(calculator: BmiCalculator) {
        self.calculator = calculator
    }
        
    func execute(bmi: Double) throws -> BmiCategory {
        return try calculator.calculateBmiCategory(bmi: bmi)
    }
}
