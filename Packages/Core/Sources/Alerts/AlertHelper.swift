//
//  File.swift
//  
//
//  Created by Tharin Zaman on 09/03/2024.
//

import Foundation

@available(iOS 13.0, *)
public protocol AlertHelper {
    
    func errorToAlert(
        error: Error
    ) -> AlertModel
        
}
