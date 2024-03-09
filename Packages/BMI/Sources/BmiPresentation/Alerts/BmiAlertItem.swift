//
//  File.swift
//
//
//  Created by Tharin Zaman on 29/02/2024.
//

import Foundation
import Alerts

@available(iOS 13.0, *)
public struct BmiAlertItem {
    
    public static let invalidWeight = AlertModel(
        title: "Invalid weight",
        message: "Please provide a valid weight"
    )
    
    public static let invalidHeight = AlertModel(
        title: "Invalid height",
        message: "Please provide a valid height"
    )
    
    public static let unableToComplete = AlertModel(
        title: "Unable to complete",
        message: "Please contact customer services"
    )
}
