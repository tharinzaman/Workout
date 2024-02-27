//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import UserNotifications

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenterSuccess: UNUserNotificationCenter {
    
    override func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        completionHandler(
            MockUNNotificationSettingsAuthorized(
                coder: NSCoder()
            )
        )
    }
    
    override func requestAuthorization(
        options: UNAuthorizationOptions = []
    ) async throws -> Bool {
        return true
    }
    
}
