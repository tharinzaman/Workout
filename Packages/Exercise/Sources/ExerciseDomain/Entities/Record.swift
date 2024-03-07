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
    
    public var workoutName: String
    public var timestamp: Date
    public var duration: Int
    
    public init(
        workoutName: String,
        timestamp: Date,
        duration: Int
    ) {
        self.workoutName = workoutName
        self.timestamp = timestamp
        self.duration = duration
    }
}
