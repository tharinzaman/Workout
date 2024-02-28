//
//  File.swift
//  
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation

public protocol GetImperialBmi {
    
    func execute(
        weight: Double,
        feet: Int,
        inches: Int
    ) -> Double
    
}
