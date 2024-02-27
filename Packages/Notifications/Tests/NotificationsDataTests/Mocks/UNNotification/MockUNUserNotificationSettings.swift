//
//  File.swift
//  
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import UserNotifications

final class MockUNNotificationSettingsAuthorized: UNNotificationSettings {
    
    override var authorizationStatus: UNAuthorizationStatus {
        return .authorized
    }
}

final class MockUNNotificationSettingsNotDetermined: UNNotificationSettings {
    
    override var authorizationStatus: UNAuthorizationStatus {
        return .notDetermined
    }
}

final class MockUNNotificationSettingsDenied: UNNotificationSettings {
    
    override var authorizationStatus: UNAuthorizationStatus {
        return .denied
    }
}
