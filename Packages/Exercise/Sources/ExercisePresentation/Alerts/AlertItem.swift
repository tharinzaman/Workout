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
        message: "Please check your internet connection, otherwise contact customer services."
    )
    
}
