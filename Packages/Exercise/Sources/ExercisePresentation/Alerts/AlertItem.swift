//
//  File.swift
//
//
//  Created by Tharin Zaman on 01/03/2024.
//

import Foundation

@available(
    iOS 13.0,
    *
)
public struct AlertItem {
    
    public static let unableToFetchExercises = AlertModel(
        title: "Unable to fetch exercises.",
        message: "Please check your internet connection."
    )
    
    public static let badUrl = AlertModel(
        title: "Bad URL",
        message: advice
    )
    
    public static let badResponse = AlertModel(
        title: "Bad Response",
        message: advice
    )
    
    public static let badData = AlertModel(
        title: "Bad Data",
        message: advice
    )
        
}

fileprivate let advice = "Please try again later or contact customer services."
