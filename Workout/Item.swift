//
//  Item.swift
//  Workout
//
//  Created by Tharin Zaman on 24/02/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
