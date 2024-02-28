//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation

public protocol GetBmiCategory {
    
    func execute(
        bmi: Double
    ) -> BmiCategory
}
