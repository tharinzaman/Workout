//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation

public protocol GetBmi {
    
    func execute(
        height: Double,
        weight: Double,
        unit: UnitCategory
    ) -> Double
    
}
