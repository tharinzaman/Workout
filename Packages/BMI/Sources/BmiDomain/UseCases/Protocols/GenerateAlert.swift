//
//  File.swift
//  
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation

@available(iOS 13.0, *)
public protocol GenerateAlert {
    
    func execute(error: Error) -> AlertModel
    
}
