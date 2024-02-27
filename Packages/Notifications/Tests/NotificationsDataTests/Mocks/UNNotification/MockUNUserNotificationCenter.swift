//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import UserNotifications
import NotificationsDomain

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_PermissionsGranted: UNUserNotificationCenter {
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    
    override func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        completionHandler(
            MockUNNotificationSettingsAuthorized() ?? MockUNNotificationSettingsAuthorized(
                coder: NSCoder()
            )
        )
    }
    
    override func requestAuthorization(
        options: UNAuthorizationOptions = [],
        completionHandler: @escaping (
            Bool,
            Error?
        ) -> Void
    ) {
        requestAuthorizationCalled = true
        completionHandler(
            true,
            nil
        )
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_PermissionsDenied: UNUserNotificationCenter {
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    
    override func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        completionHandler(
            MockUNNotificationSettingsDenied() ?? MockUNNotificationSettingsDenied(
                coder: NSCoder()
            )
        )
    }
    
    override func requestAuthorization(
        options: UNAuthorizationOptions = [],
        completionHandler: @escaping (
            Bool,
            Error?
        ) -> Void
    ) {
        requestAuthorizationCalled = true
        completionHandler(
            true,
            nil
        )
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_PermissionsNotDetermined: UNUserNotificationCenter {
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    
    override func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        completionHandler(
            MockUNNotificationSettingsNotDetermined() ?? MockUNNotificationSettingsNotDetermined(
                coder: NSCoder()
            )
        )
    }
    
    override func requestAuthorization(
        options: UNAuthorizationOptions = [],
        completionHandler: @escaping (
            Bool,
            Error?
        ) -> Void
    ) {
        requestAuthorizationCalled = true
        completionHandler(
            true,
            nil
        )
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_RequestAuthReturnsError: UNUserNotificationCenter {
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    
    override func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        completionHandler(
            MockUNNotificationSettingsNotDetermined() ?? MockUNNotificationSettingsNotDetermined(
                coder: NSCoder()
            )
        )
    }
    
    override func requestAuthorization(
        options: UNAuthorizationOptions = [],
        completionHandler: @escaping (
            Bool,
            Error?
        ) -> Void
    ) {
        requestAuthorizationCalled = true
        completionHandler(
            true,
            NotificationError.failedToRegisterNotification
        )
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_NotifNotAllowed: UNUserNotificationCenter {
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    
    override func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        completionHandler(
            MockUNNotificationSettingsNotDetermined() ?? MockUNNotificationSettingsNotDetermined(
                coder: NSCoder()
            )
        )
    }
    
    override func requestAuthorization(
        options: UNAuthorizationOptions = [],
        completionHandler: @escaping (
            Bool,
            Error?
        ) -> Void
    ) {
        requestAuthorizationCalled = true
        completionHandler(
            false,
            nil
        )
    }
}
