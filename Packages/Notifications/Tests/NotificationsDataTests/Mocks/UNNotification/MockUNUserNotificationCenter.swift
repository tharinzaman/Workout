//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import UserNotifications
import NotificationsDomain

class MockNSCoder: NSCoder {
    var authorizationStatus = UNAuthorizationStatus.authorized.rawValue
    
    override func decodeInt64(forKey key: String) -> Int64 {
        return Int64(authorizationStatus)
    }
    
    override func decodeBool(forKey key: String) -> Bool {
        return true
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_PermissionsGranted: UNUserNotificationCenterProtocol {

    init() {}
        
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    private(set) var removePendingNotificationRequestsCalled = false
    private(set) var addCalled = false

    func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        if let settings = MockUNNotificationSettingsAuthorized(coder: MockNSCoder()) {
            completionHandler(settings)
        } else {
            fatalError("Mocking UNNotificationSettings failed")
        }
    }
    
    func requestAuthorization(
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
    
    func removePendingNotificationRequests(withIdentifiers identifiers: [String]) {
        removePendingNotificationRequestsCalled = true
    }
    
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?) {
        addCalled = true
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_PermissionsDenied: UNUserNotificationCenterProtocol {
    
    init() {}
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    private(set) var removePendingNotificationRequestsCalled = false
    private(set) var addCalled = false
    
    func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        if let settings = MockUNNotificationSettingsDenied(coder: MockNSCoder()) {
            completionHandler(settings)
        } else {
            fatalError("Mocking UNNotificationSettings failed")
        }
    }
    
    func requestAuthorization(
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
    
    func removePendingNotificationRequests(withIdentifiers identifiers: [String]) {
        removePendingNotificationRequestsCalled = true
    }
    
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?) {
        addCalled = true
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_PermissionsNotDetermined: UNUserNotificationCenterProtocol {
    
    init() {}
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    private(set) var removePendingNotificationRequestsCalled = false
    private(set) var addCalled = false
    
    func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        if let settings = MockUNNotificationSettingsNotDetermined(coder: MockNSCoder()) {
            completionHandler(settings)
        } else {
            fatalError("Mocking UNNotificationSettings failed")
        }
    }
    
    func requestAuthorization(
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
    
    func removePendingNotificationRequests(withIdentifiers identifiers: [String]) {
        removePendingNotificationRequestsCalled = true
    }
    
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?) {
        addCalled = true
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_RequestAuthReturnsError: UNUserNotificationCenterProtocol {
    
    init() {}
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    private(set) var removePendingNotificationRequestsCalled = false
    private(set) var addCalled = false
    
    func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        if let settings = MockUNNotificationSettingsNotDetermined(coder: MockNSCoder()) {
            completionHandler(settings)
        } else {
            fatalError("Mocking UNNotificationSettings failed")
        }
    }
    
    func requestAuthorization(
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
    
    func removePendingNotificationRequests(withIdentifiers identifiers: [String]) {
        removePendingNotificationRequestsCalled = true
    }
    
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?) {
        addCalled = true
    }
}

@available(
    iOS 13.0.0,
    *
)
final class MockUNUserNotificationCenter_UserDidNotAllow: UNUserNotificationCenterProtocol {
    
    init() {}
    
    private(set) var getNotificationSettingsCalled = false
    private(set) var requestAuthorizationCalled = false
    private(set) var removePendingNotificationRequestsCalled = false
    private(set) var addCalled = false
    
    func getNotificationSettings(
        completionHandler: @escaping (
            UNNotificationSettings
        ) -> Void
    ) {
        getNotificationSettingsCalled = true
        if let settings = MockUNNotificationSettingsNotDetermined(coder: MockNSCoder()) {
            completionHandler(settings)
        } else {
            fatalError("Mocking UNNotificationSettings failed")
        }
    }
    
    func requestAuthorization(
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
    
    func removePendingNotificationRequests(withIdentifiers identifiers: [String]) {
        removePendingNotificationRequestsCalled = true
    }
    
    func add(_ request: UNNotificationRequest, withCompletionHandler completionHandler: ((Error?) -> Void)?) {
        addCalled = true
    }
}
