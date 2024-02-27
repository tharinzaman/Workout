//
//  File.swift
//  
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation

public protocol NotificationHelper {
    
    func registerNotification(
        identifier: String,
        title: String,
        body: String,
        hour: Int,
        minute: Int,
        daily: Bool
    ) throws
    
    func areNotificationsEnabled() -> Bool
}
