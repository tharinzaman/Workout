//
//  File.swift
//  
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation

public enum NotificationError: Error {
    case missingPermissions
    case failedToRegisterNotification
    case unknownNotificationError
}
