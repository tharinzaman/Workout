//
//  File.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation

// TODO: Move this into a common module and potentially make it generic
@available(iOS 13.0, *)
public protocol AlertHelper {
    
    func errorToWorkoutErrorAlert(
        error: Error
    ) -> AlertModel
    
}
