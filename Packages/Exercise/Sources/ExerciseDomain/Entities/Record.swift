//
//  File.swift
//  
//
//  Created by Tharin Zaman on 07/03/2024.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
public class Record {
    
    public var exerciseName: String
    public var timestamp: Date
    public var duration: String
    
    public init(
        exerciseName: String,
        timestamp: Date,
        duration: String
    ) {
        self.exerciseName = exerciseName
        self.timestamp = timestamp
        self.duration = duration
    }
}
